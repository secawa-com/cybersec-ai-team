---
name: context-setup
version: 0.1.0
description: |
  Interactive setup and management of CYBERSECTEAM organizational context files.
  Creates, updates, or appends to organization.md, about-me.md, strategy.md,
  team.md, governance.md. Also saves decisions and lessons to knowledge base (kb/).
  Use when user says "kontekst", "setup", "zaktualizuj kontekst", "dodaj do kontekstu",
  "zapamiętaj", "zapisz do KB", "zapisz ustalenie", "brak plików kontekstowych",
  "context setup", "create context", "update context", "save to KB".
  Do NOT use for regular security questions or analysis.
metadata:
  author: Piotr Kaźmierczak - CEO Secawa
  category: cybersecurity
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - AskUserQuestion
---

## Preambuła

```bash
CYBERSEC_CTX=".claude/cybersecteam"
mkdir -p "$CYBERSEC_CTX/kb"
echo "=== Status plików kontekstowych ==="
for f in organization.md about-me.md strategy.md team.md governance.md; do
  if [ -f "$CYBERSEC_CTX/$f" ]; then
    echo "  ✓ $f ($(wc -l < "$CYBERSEC_CTX/$f" | tr -d ' ') linii)"
  else
    echo "  ✗ $f (brak)"
  fi
done
KB_COUNT=$(find "$CYBERSEC_CTX/kb" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo "  KB: $KB_COUNT wpisów"
```

## Instrukcje

Twoim zadaniem jest przeprowadzenie CISO przez interaktywny wywiad i wygenerowanie plików kontekstowych.

### Tryb pracy

1. Pokaż status plików (wynik preambuły)
2. Określ tryb na podstawie pytania użytkownika:

#### Tryb A: Tworzenie od zera (brak pliku lub użytkownik chce od nowa)
- Przeprowadź pełny wywiad (pytania poniżej, PO KOLEI)
- Po każdym pytaniu podaj 2-3 przykładowe odpowiedzi
- Po zebraniu odpowiedzi - wygeneruj plik .md
- Pokaż preview i zapytaj o korekty
- Zapisz do `.claude/cybersecteam/[nazwa].md` (Write tool)
- Zapytaj czy kontynuować z kolejnym plikiem

#### Tryb B: Aktualizacja istniejącego pliku
- Przeczytaj aktualną zawartość pliku (Read tool)
- Pokaż użytkownikowi podsumowanie co jest teraz
- Zapytaj: "Co chcesz zmienić lub dodać?"
- Zmodyfikuj TYLKO wskazane sekcje (Edit tool - nie nadpisuj całego pliku)
- Pokaż diff zmian → zapisz po potwierdzeniu

#### Tryb C: Szybki zapis do KB (knowledge base)
- Użytkownik podaje ustalenie / decyzję / lekcję do zapamiętania
- Wygeneruj wpis w formacie KB:

```markdown
# [Tytuł]

**Data:** YYYY-MM-DD
**Skill:** cybersecteam / [nazwa skilla który wygenerował ustalenie]
**Powiązane pliki:** [np. governance.md, strategy.md]

## Kontekst
[Opis sytuacji / źródło ustalenia]

## Kluczowe ustalenia
- [...]

## Wnioski i rekomendacje
[...]

## Reasoning Path
- Źródła: [tagi]
- Założenia: [...]
- Ograniczenia: [...]
```

- Zapisz do `.claude/cybersecteam/kb/YYYY-MM-DD-[slug].md`
- Potwierdź zapis

### Automatyczne wykrywanie trybu

- Użytkownik mówi "zaktualizuj", "zmień", "dodaj do" → **Tryb B**
- Użytkownik mówi "zapamiętaj", "zapisz do KB", "ustaliliśmy że", "zanotuj" → **Tryb C**
- Użytkownik mówi "stwórz", "setup", brak pliku → **Tryb A**
- W razie wątpliwości → zapytaj który tryb

### Pytania dla poszczególnych plików

#### organization.md
1. W jakiej branży działa Twoja organizacja? (np. "Finanse - bank komercyjny", "Produkcja - automotive", "IT - SaaS B2B")
2. Jaka jest wielkość organizacji? Ilu pracowników, ile lokalizacji? (np. "~2000 osób, 5 lokalizacji w Polsce")
3. Jak wygląda struktura organizacyjna - gdzie jest cyberbezpieczeństwo? (np. "CISO → CTO → Zarząd")
4. Jakie regulacje obowiązują organizację? (np. "RODO, NIS2, KSC, regulacje sektorowe KNF")
5. Jaki jest stack technologiczny? Cloud/on-prem/hybrid? (np. "Azure hybrid, AD, SAP, O365")
6. Jakie specyficzne wyzwania wynikają z charakteru organizacji? (np. "Systemy OT, legacy, M&A")

#### about-me.md
1. Jaki jest Twój oficjalny tytuł i pozycja? (np. "CISO raportujący do CTO", "Dyrektor ds. Bezpieczeństwa")
2. Za jakie obszary odpowiadasz - co jest w scope, a co nie? (np. "InfoSec, compliance, SOC. Poza scope: IT ops, fizyczne")
3. Jak preferujesz pracować - strategicznie vs operacyjnie? (np. "80/20 strategia/hands-on")
4. W jakich obszarach AI ma Ci najbardziej pomagać? (np. "Drafting, research, materiały dla zarządu")
5. Do kogo raportujesz, jak często, w jakim formacie? (np. "Kwartalnie zarząd, miesięcznie CTO")
6. Jakie jest Twoje tło zawodowe? (np. "15 lat IT/sec, CISSP, ex-pentester")

#### strategy.md
1. Jakie są główne cele bezpieczeństwa na ten rok? (np. "ISO 27001, SOC, NIS2 compliance")
2. Jakie projekty bezpieczeństwa są w toku lub planowane? (np. "SIEM Q2, DLP Q3, PAM Q1")
3. Co jest priorytetowe w najbliższych 3 miesiącach? (np. "Gap analysis NIS2, rekrutacja SOC")
4. Jaki budżet i jakie ograniczenia zasobowe? (np. "2M PLN/rok, brak specjalistów na rynku")
5. Jakie metryki śledzisz? (np. "MTTD, MTTR, % compliance, liczba incydentów")

#### team.md
1. Jak wygląda struktura zespołu bezpieczeństwa? (np. "CISO → 3 team leady → 12 osób")
2. Jakie role są w zespole i za co odpowiadają? (np. "SOC L1-L2, GRC, ITSec, Architect")
3. Gdzie brakuje kompetencji lub zasobów? (np. "Brak cloud security, threat hunting")
4. Z jakimi działami współpracujesz? (np. "IT Ops, Legal, HR, DevOps")
5. Co jest outsourcowane? (np. "SOC L1 MDR, pentesty, DPO")

#### governance.md
1. Jak podejmowane są decyzje dotyczące bezpieczeństwa? (np. "CISO operacyjnie, budżet > 50k → CTO")
2. Jakie polityki bezpieczeństwa obowiązują i jaki jest ich status? (np. "ISMS aktualna, BYOD brak")
3. Jakie kluczowe procesy bezpieczeństwa funkcjonują? (np. "IR, vuln mgmt, access review kwartalnie")
4. Jak wygląda eskalacja incydentów? (np. "Krytyczny → CISO natychmiast → CTO 1h → zarząd 4h")
5. Jaki jest status zgodności z regulacjami? (np. "NIS2 gap analysis 60%, RODO OK, ISO planowany")
6. Jak często i jakie audyty? (np. "Wewnętrzny co 6 mies., zewnętrzny rocznie, pentesty 2x/rok")

## Weryfikacja przed prezentacją

- [ ] Wygenerowany plik nie zawiera haseł, tokenów, kluczy API ani danych osobowych (PESEL, NIP osób fizycznych)?
- [ ] Dane są konkretne (nie placeholder'y) - uzupełnione odpowiedziami z wywiadu?
- [ ] Format pliku jest spójny z istniejącymi plikami kontekstowymi?
- [ ] Preview pokazany użytkownikowi przed zapisem?

## Troubleshooting

| Problem | Rozwiązanie |
|---------|------------|
| Plik już istnieje | Zapytaj: tryb A (od nowa) czy tryb B (aktualizacja). |
| Odpowiedzi zbyt ogólne | Dopytaj raz z konkretnymi przykładami. Nie naciskaj. |
| Użytkownik chce zapisać ustalenie | Tryb C - zapis do KB (.claude/cybersecteam/kb/). |

## Przykłady użycia

### Scenariusz 1: Pierwsze uruchomienie
**Użytkownik**: "/cybersecteam:context-setup"
**Działania**: Status plików → priorytet brakujących → wywiad → generowanie → preview → zapis
**Wynik**: Pliki kontekstowe gotowe do użycia przez inne skille

### Styl komunikacji

- Po polsku
- Profesjonalny ale przyjazny - to jest wywiad, nie przesłuchanie
- Jedno pytanie na raz, z przykładowymi odpowiedziami
- Nie oceniaj odpowiedzi - zbieraj dane
- Jeśli odpowiedź jest zbyt ogólna - dopytaj raz (ale nie naciskaj)

### Format generowanego pliku

Użyj formatu Markdown z nagłówkami sekcji. Nie umieszczaj komentarzy HTML. Wypełnij konkretnymi danymi z wywiadu. Plik powinien być gotowy do użycia przez inne skille bez dodatkowej edycji.

## HARD STOP

> Pliki kontekstowe mogą zawierać wrażliwe dane organizacyjne. NIE zapisuj haseł, tokenów, kluczy API ani danych osobowych. Zweryfikuj z użytkownikiem przed zapisem.
