# CYBERSECTEAM - Developer Instructions

Te instrukcje dotyczą pracy nad kodem pluginu, nie korzystania z niego.

## Język

- Kod, struktura, nazwy plików: angielski
- Treści skilli, output, pliki kontekstowe: polski
- Styl: profesjonalny, dyrektywny, techniczny, na poziomie CISO

## Struktura projektu

- `.claude-plugin/plugin.json` - manifest pluginu
- `skills/*/SKILL.md` - skille interaktywne
- `agents/cst-*.md` - natywne sub-agenty Claude Code
- `shared/` - współdzielone reguły (preamble, anti-hallucination, data-sensitivity)
- `context-templates/` - szablony plików kontekstowych

## Ścieżki

- W SKILL.md: `${CLAUDE_SKILL_DIR}/../../shared/` do shared rules
- Kontekst organizacyjny: `.claude/cybersecteam/` (poziom projektu, poza pluginem)
- W agentach: `${CLAUDE_SKILL_DIR}/../shared/` lub fallback z `find`

## Dodawanie nowych skilli (do pluginu)

1. Stwórz `skills/[nazwa]/SKILL.md` wg `skills/skill-creator/references/skill-template.md`
2. Stwórz `agents/cst-[nazwa].md` wg `skills/skill-creator/references/subagent-template.md`
3. Zaktualizuj `skills/manager/SKILL.md` (tabele skilli i agentów)
4. Uruchom `./dev-check [nazwa]` aby zwalidować

## Konwencje

- Nazwy skilli: kebab-case w `skills/`
- Nazwy sub-agentów: `cst-[nazwa]` w `agents/`
- Sub-agenci: natywny format Claude Code
- Descriptions: trzecia osoba, trigger phrases PL+EN, negative triggers
- SKILL.md body: < 500 linii, referencje max 1 poziom głęboko

## Testowanie

```bash
claude --plugin-dir ./       # Test lokalny
./dev-check                  # Walidacja struktury
./dev-check risk-assess      # Walidacja konkretnego skilla
```
