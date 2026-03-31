---
name: [nazwa-skilla]
description: |
  [Opis w trzeciej osobie - co skill robi, 2-3 linie].
  Use when user says "[trigger phrase PL]", "[trigger phrase EN]", "[trigger phrase]".
  Do NOT use for [czego nie robić] (use /[alternatywny-skill] instead).
metadata:
  author: Piotr Kaźmierczak - CEO Secawa
  category: cybersecurity
allowed-tools:
  - [lista narzędzi]
---

## Preambuła
Wykonaj `${CLAUDE_SKILL_DIR}/../../shared/preamble.md`, następnie przeczytaj `${CLAUDE_SKILL_DIR}/../../shared/anti-hallucination.md` i `${CLAUDE_SKILL_DIR}/../../shared/data-sensitivity.md`.

### Dodatkowy kontekst

Załaduj dodatkowe pliki kontekstowe potrzebne dla tej specjalizacji:
```bash
for f in ".claude/cybersecteam"/{[pliki].md}; do
  [ -f "$f" ] && echo "=== $(basename "$f") ===" && cat "$f" && echo ""
done
```

---

## Tożsamość

**Rola**: [nazwa roli]
**Specjalizacja**: [obszar]
**Metodologie**: [lista frameworków/standardów]

## Workflow

### Krok 1: Pytania doprecyzowujące

ZANIM zaczniesz pracę, zadaj pytania (AskUserQuestion).

Jeśli użytkownik podał wystarczający kontekst - pomiń pytania na które już znasz odpowiedź.
Ale ZAWSZE upewnij się że masz minimum: **[dane 1]**, **[dane 2]**, **[dane 3]**.

1. [Pytanie 1 - z przykładowymi odpowiedziami]
2. [Pytanie 2]
3. [Pytanie 3]

### Krok 2: [Główne zadanie]

[Instrukcje specyficzne dla skilla]

### Krok 3: [Analiza / output]

[Format outputu]

## Weryfikacja przed prezentacją

Przed przedstawieniem wyniku sprawdź:
- [ ] Każda rekomendacja uzasadniona źródłem?
- [ ] Nie pominięto kluczowego aspektu z kontekstu organizacyjnego?
- [ ] Rekomendacje są actionable (konkretne, z next steps)?
- [ ] Blok PEWNOŚĆ rzetelnie odzwierciedla jakość odpowiedzi?

## Troubleshooting

| Problem | Rozwiązanie |
|---------|------------|
| [problem 1] | [rozwiązanie] |
| [problem 2] | [rozwiązanie] |

## Przykłady użycia

### Scenariusz 1: [tytuł]
**Użytkownik**: "[prompt]"
**Działania**: [kroki]
**Wynik**: [output]

## Dodatkowe reguły

- [Reguły specyficzne dla domeny]
- Każde twierdzenie taguj źródłem wg shared/anti-hallucination.md
- Odpowiedź kończy się blokiem PEWNOŚĆ

## HARD STOP

> [Zastrzeżenia specyficzne dla domeny]
