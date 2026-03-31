# CYBERSECTEAM - AI Cybersecurity Team for Claude Code

Wirtualny zespół cyberbezpieczeństwa AI wspierający CISO w codziennej pracy. Plugin do [Claude Code](https://claude.ai/claude-code) dostarczający kilku wyspecjalizowanych ekspertów AI w dziedzinach: ocena ryzyka, compliance, dokumentacja bezpieczeństwa z możliwością rozbudowanie zespołu AI o własnych specjalistów.

**Autor**: Piotr Kaźmierczak - CEO [Secawa](https://secawa.com)
**Licencja**: MIT
**Wersja**: 0.1.0

## Instalacja

### Krok 1: Dodaj marketplace

```bash
/plugin marketplace add secawa-com/cybersec-ai-team
```

### Krok 2: Zainstaluj plugin

```bash
/plugin install cybersecteam@secawa-cybersecteam
```

### Krok 3: Przeładuj pluginy

```bash
/reload-plugins
```

### Krok 4: Skonfiguruj kontekst organizacyjny

```
/cybersecteam:context-setup
```

## Aktualizacja

### Ręczna aktualizacja

```bash
/plugin marketplace update secawa-cybersecteam
/plugin update cybersecteam@secawa-cybersecteam
/reload-plugins
```

### Automatyczna aktualizacja

Włącz auto-update dla marketplace, aby plugin aktualizował się automatycznie przy starcie Claude Code:

1. Uruchom `/plugin`
2. Przejdź do zakładki **Marketplaces**
3. Wybierz **secawa-cybersecteam**
4. Włącz **Enable auto-update**

Po automatycznej aktualizacji pojawi się powiadomienie z prośbą o `/reload-plugins`.

## Używanie

Zastanawiasz się jak wykorzystać plugin w praktyce? Po instalacji uruchom claude i po prostu napisz:

`/cybersecteam:manager Jak mogę wykorzystać cyberzespół AI w praktyce?`

## Dostępne skille


| Skill             | Opis                                                 | Wywołanie                     |
| ----------------- | ---------------------------------------------------- | ----------------------------- |
| **Manager**       | Koordynator zespołu, wirtualny zastępca CISO         | `/cybersecteam:manager`       |
| **Risk Assess**   | Ocena ryzyka ISO 27005 / NIST RMF                    | `/cybersecteam:risk-assess`   |
| **Compliance**    | Gap analysis NIS2, DORA, ISO 27001, RODO             | `/cybersecteam:compliance`    |
| **Policy Draft**  | Drafting polityk, procedur, standardów               | `/cybersecteam:policy-draft`  |
| **HR**            | Diagnoza potrzeb zespołu AI, definiowanie nowych ról | `/cybersecteam:hr`            |
| **Skill Creator** | Tworzenie nowych specjalistów AI                     | `/cybersecteam:skill-creator` |
| **Context Setup** | Zarządzanie kontekstem organizacyjnym                | `/cybersecteam:context-setup` |


## Sub-agenci (autonomiczni)

Sub-agenci działają w izolowanym kontekście - nie pytają, zwracają ustrukturyzowany wynik. Delegowani automatycznie lub na żądanie.


| Agent              | Specjalizacja                       |
| ------------------ | ----------------------------------- |
| `cst-risk-assess`  | Autonomiczna ocena ryzyka           |
| `cst-compliance`   | Autonomiczne mapowanie zgodności    |
| `cst-policy-draft` | Autonomiczne generowanie dokumentów |
| `cst-checker`      | Audyt jakości skilli i agentów      |


## Jak to działa

1. **Kontekst organizacyjny** - Plugin używa plików kontekstowych tworzonych w projekcie (`.claude/cybersecteam/`) opisujących organizację, strategię, zespół i governance. Im lepszy kontekst, tym trafniejsze odpowiedzi.
2. **Koordynator** - `/cybersecteam:manager` to główny punkt wejścia. Analizuje pytanie i deleguje do odpowiedniego specjalisty.
3. **Shared rules** - Wszystkie skille stosują reguły anty-halucynacyjne (source tagging, confidence rating), obsługi danych wrażliwych i spójny styl komunikacji.
4. **Rozszerzalność** - Możesz tworzyć własnych specjalistów AI (`/cybersecteam:hr` → `/cybersecteam:skill-creator`). Nowe skille instalują się w `~/.claude/skills/cst-*/` i są automatycznie odkrywane przez managera.

## Kontekst organizacyjny

Pliki kontekstowe przechowywane w `.claude/cybersecteam/` (poziom projektu):


| Plik              | Zawartość                                         |
| ----------------- | ------------------------------------------------- |
| `organization.md` | Branża, wielkość, regulacje, stack technologiczny |
| `about-me.md`     | Rola CISO, zakres odpowiedzialności, styl pracy   |
| `strategy.md`     | Cele bezpieczeństwa, projekty, budżet, KPI        |
| `team.md`         | Struktura zespołu, kompetencje, luki              |
| `governance.md`   | Polityki, procesy, eskalacja, status compliance   |
| `kb/*.md`         | Baza wiedzy - decyzje, ustalenia, lessons learned |


## Mechanizmy jakości

### Source tagging

Każde twierdzenie oznaczone źródłem: `[GOV]`, `[STRAT]`, `[ORG]`, `[REG:NIS2 Art.21]`, `[STD:ISO27001 A.8.2]`, `[WEB]`, `[GEN]`.

### Confidence rating

Każda odpowiedź kończy się oceną pewności (WYSOKA/ŚREDNIA/NISKA) z listą źródeł i ograniczeń.

### Hard stops

Obowiązkowe zastrzeżenia przy tematach o nieodwracalnych konsekwencjach: interpretacja prawna, scoring ryzyka, aktywne incydenty, architektura bezpieczeństwa.

### Ograniczenia

Modele językowe działają w sposób niedeterministyczny. Mechanizmy jakości zmniejszają ryzyko konfabulacji, ale go nie eliminują. Framework traktuje je jako **warstwę wsparcia, nie gwarancję**. Odpowiedzialność za weryfikację outputów i decyzje biznesowe spoczywa na użytkowniku (CISO).

## Rozszerzanie zespołu AI

1. `/cybersecteam:hr` - diagnoza potrzeb (lub Tryb B jeśli wiesz czego potrzebujesz)
2. `/cybersecteam:skill-creator` - techniczne tworzenie SKILL.md + sub-agenta
3. `cst-checker` - automatyczna walidacja jakości
4. Nowy specjalista dostępny jako `/cst-[nazwa]`

Skille tworzone przez użytkownika żyją w `~/.claude/skills/cst-*/` i są automatycznie odkrywane przez managera.

## Dla developerów

### Testowanie lokalne

```bash
claude --plugin-dir ./
```

### Walidacja

```bash
./dev-check                  # Sprawdź cały plugin
./dev-check risk-assess      # Sprawdź konkretny skill
```

### Struktura projektu

```
cybersec-ai-team/
├── .claude-plugin/
│   └── plugin.json          # Manifest pluginu
├── skills/                  # Skille (SKILL.md + references/)
│   ├── manager/
│   ├── risk-assess/
│   ├── compliance/
│   ├── policy-draft/
│   ├── hr/
│   ├── skill-creator/
│   └── context-setup/
├── agents/                  # Sub-agenci (natywni Claude Code)
│   ├── cst-checker.md
│   ├── cst-compliance.md
│   ├── cst-policy-draft.md
│   └── cst-risk-assess.md
├── shared/                  # Współdzielone reguły
│   ├── preamble.md
│   ├── anti-hallucination.md
│   └── data-sensitivity.md
├── context-templates/       # Szablony plików kontekstowych
├── dev-check                # Walidacja struktury
└── dev-setup                # Setup dla współtwórców
```

### Konwencje

- Nazwy skilli: kebab-case (w `skills/`)
- Nazwy agentów: `cst-[nazwa].md` (w `agents/`)
- Ścieżki w SKILL.md: `${CLAUDE_SKILL_DIR}/../../shared/`
- Kontekst: `.claude/cybersecteam/` (poziom projektu)
- Język treści: polski (styl CISO-level)
- Kod/struktura: angielski

## Wymagania

- [Claude Code](https://claude.com/claude-code) (CLI, desktop app lub IDE extension)

## Autor

**Piotr Kaźmierczak** - CEO [Secawa](https://secawa.com)

### O Secawa

Secawa - Security Awareness, strategia i usługi ofensywne.

Wzmacniamy odporność organizacji na cyberataki - zanim uderzą w biznes. 7+ lat doświadczenia na trzech kontynentach, 120 000+ przeszkolonych pracowników, 98% satysfakcji klientów.

**Usługi:**

- **Security Awareness** - Praktyczny Trening Antyphishingowy, symulowane ataki z mikro-szkoleniami
- **Testy penetracyjne** - aplikacje webowe, API, infrastruktura IT, mobilne
- **CISO as a Service** - strategiczne wsparcie bezpieczeństwa
- **SSDLC** - konsultacje Secure Software Development Lifecycle
- **OSINT / White-hat Intelligence** - analiza ekspozycji i zagrożeń

**Kontakt:** [contact@secawa.com](mailto:contact@secawa.com) | +48 732 123 579 | [secawa.com](https://secawa.com)