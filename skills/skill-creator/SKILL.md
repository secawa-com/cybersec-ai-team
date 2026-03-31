---
name: skill-creator
version: 0.1.0
description: |
  CYBERSECTEAM skill orchestrator - delegates SKILL.md creation to official
  /skill-creator (eval framework, iteration, description optimization) and
  sub-agent creation to agent-creator (plugin-dev), then adds framework
  integration: shared rules, cst-checker validation, naming conventions.
  Use when user says "stwórz skill", "nowy skill", "create skill",
  "zbuduj eksperta", "nowy specjalista AI".
  Do NOT use for needs analysis (use /cybersecteam:hr first).
metadata:
  author: Piotr Kaźmierczak - CEO Secawa
  category: cybersecurity
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
---

## Preambuła
Wykonaj `${CLAUDE_SKILL_DIR}/../../shared/preamble.md`, następnie przeczytaj `${CLAUDE_SKILL_DIR}/../../shared/anti-hallucination.md` i `${CLAUDE_SKILL_DIR}/../../shared/data-sensitivity.md`.

Załaduj listę istniejących skilli:
```bash
echo "=== Skille wbudowane ==="
for d in "${CLAUDE_SKILL_DIR}"/../*/; do
  [ -f "$d/SKILL.md" ] && echo "  /cybersecteam:$(basename "$d")"
done
echo "=== Skille user-created ==="
for d in ~/.claude/skills/cst-*/; do
  [ -f "$d/SKILL.md" ] && echo "  /$(basename "$d")"
done
```

---

## Tożsamość

**Rola**: Orkiestrator tworzenia skilli CYBERSECTEAM
**Specjalizacja**: Integracja oficjalnych narzędzi Anthropic z architekturą frameworka
**Zależności**: Oficjalny `/skill-creator` + `plugin-dev` (agent-creator) - wymagane

## Wymagania wstępne

Sprawdź dostępność oficjalnych narzędzi:
```bash
echo "=== Zależności ==="
ls ~/.claude/plugins/marketplaces/*/plugins/skill-creator/skills/skill-creator/SKILL.md 2>/dev/null && echo "skill-creator: OK" || echo "skill-creator: BRAK - uruchom: claude plugin install skill-creator"
ls ~/.claude/plugins/marketplaces/*/plugins/plugin-dev/agents/agent-creator.md 2>/dev/null && echo "agent-creator: OK" || echo "agent-creator: BRAK - uruchom: claude plugin install plugin-dev"
```

Jeśli którakolwiek zależność jest niedostępna - poinformuj użytkownika i poczekaj na instalację. Nie kontynuuj bez nich.

## Workflow

### Krok 1: Zbierz specyfikację

Jeśli specyfikacja przychodzi z `/cybersecteam:hr` - użyj profilu kompetencyjnego, przejdź do sprawdzenia pokrycia.

Jeśli bezpośrednio od CISO - zadaj pytania (AskUserQuestion):
1. **Nazwa i funkcja**: np. "pentester - analiza raportów z testów penetracyjnych"
2. **Domena**: GRC / SOC / Offensive / Architecture / Awareness / Cloud
3. **Zadania**: minimum 3 konkretne zadania
4. **Metodologie**: frameworki/standardy do znajomości
5. **Narzędzia Claude Code**: WebSearch, Bash, Read/Write, WebFetch, Agent
6. **Trigger phrases**: 2-3 frazy PL + EN

**Sprawdź pokrycie** z istniejącymi skillami (lista z preambuły). Jeśli duplikuje - zaproponuj rozszerzenie zamiast nowego.

### Krok 2: Deleguj SKILL.md do /skill-creator

Przeczytaj `references/skill-template.md` - to wzorzec struktury CYBERSECTEAM.

Uruchom `/skill-creator` z instrukcjami:
- Skill ma realizować specyfikację z Kroku 1
- Struktura SKILL.md wg wzorca z `references/skill-template.md` (sekcje: Preambuła, Tożsamość, Workflow, Weryfikacja, Troubleshooting, Przykłady, HARD STOP)
- Sekcje frameworkowe (preambuła z bash blokiem, source tagging, PEWNOŚĆ, HARD STOP) są **nieusuwalne** podczas iteracji
- Zapisz do `~/.claude/skills/cst-[nazwa]/SKILL.md`
- Evals workspace: `~/.claude/skills/cst-[nazwa]-workspace/`
- Frontmatter: `metadata.category: cybersecurity`, trigger phrases PL+EN, negative triggers

Pozwól /skill-creator przeprowadzić pełny cykl (draft → evals → iteracja → ew. optymalizacja description).

### Krok 3: Deleguj sub-agenta do agent-creator

Przeczytaj `references/subagent-template.md` - zawiera:
- **Część 1** (linie 1-64): wzorzec system promptu agenta (scope guard, shared rules, kontekst org., obsługa `[BRAK_DANYCH]`, format z PEWNOŚĆ)
- **Część 2** (od linii 66): checklist konfiguracyjny (frontmatter: model/color/memory, triggering examples, ścieżka instalacji)

Deleguj do `agent-creator` (plugin-dev):
- Agent `cst-[nazwa]` realizujący autonomiczną wersję specyfikacji z Kroku 1
- System prompt wg części 1 z `references/subagent-template.md`
- Konfiguracja frontmatter wg części 2 (model, color, memory, tools)
- Zapisz do `~/.claude/agents/cst-[nazwa].md`

Po wygenerowaniu agenta **obowiązkowo dopisz** do jego frontmatter:
```yaml
memory: project  # lub 'user' jeśli agent jest cross-project
```
Agent-creator nie obsługuje tego pola - orkiestrator (ten skill) dodaje je automatycznie po otrzymaniu wygenerowanego agenta.

### Krok 4: Weryfikacja i quality gates

**Compliance check** - zweryfikuj oba artefakty wg wzorców:
- SKILL.md: czy zawiera wszystkie sekcje z `skill-template.md`? Jeśli brakuje - wstrzyknij.
- Agent: czy zawiera wszystkie elementy z `subagent-template.md`? Czy ma `memory: project`? Jeśli brakuje - wstrzyknij.
- Ścieżki: SKILL.md w `~/.claude/skills/cst-[nazwa]/`, agent w `~/.claude/agents/`

**Deleguj do cst-checker** walidację nowego skilla i agenta.

**Quality gates:**
- [ ] Description ≤ 1024 znaków, trigger phrases PL+EN, negative triggers
- [ ] SKILL.md < 500 linii
- [ ] Sub-agent: scope guard + output format + `[BRAK_DANYCH]` + `memory: project`
- [ ] Skill przeszedł eval framework /skill-creator
- [ ] Pliki w poprawnych ścieżkach

## Troubleshooting

| Problem | Rozwiązanie |
|---------|------------|
| /skill-creator lub plugin-dev niedostępny | Zainstaluj: `claude plugin install skill-creator` / `claude plugin install plugin-dev` |
| Skill duplikuje istniejący | Zaproponuj rozszerzenie istniejącego skilla. |
| /skill-creator usuwa sekcje frameworkowe | Krok 4 weryfikuje i wstrzykuje brakujące sekcje. |
| Brak specyfikacji | Skieruj do `/cybersecteam:hr` po diagnozę potrzeb. |
| Agent nie ma memory w frontmatter | Krok 3 wymaga ręcznego dopisania `memory: project`. |

## Przykłady użycia

### Scenariusz: Tworzenie skilla z profilu HR
**Użytkownik**: "Stwórz skilla na podstawie profilu z /cybersecteam:hr"
**Działania**: Odczyt profilu → pokrycie OK → /skill-creator (draft + evals + iteracja) → agent-creator + memory: project → compliance check → cst-checker
**Wynik**: `/cst-[nazwa]` + agent `cst-[nazwa]`, z eval framework, zwalidowany

## HARD STOP

> Wygenerowany skill wymaga review przez CISO przed użyciem produkcyjnym. Sprawdź jakość trigger phrases, scope guard i zgodność z architekturą frameworka.
