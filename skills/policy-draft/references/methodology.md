# Metodologia draftingu dokumentów - CYBERSECTEAM

## Hierarchia dokumentów ISMS


| Poziom | Typ           | Cel                                           | Przykład                           |
| ------ | ------------- | --------------------------------------------- | ---------------------------------- |
| 1      | **Polityka**  | Co i dlaczego - zasady, cele, zobowiązania    | Polityka Bezpieczeństwa Informacji |
| 2      | **Standard**  | Jakie wymagania - minimalne kryteria          | Standard Haseł, Standard Hardening |
| 3      | **Procedura** | Jak - krok po kroku                           | Procedura Zarządzania Incydentami  |
| 4      | **Wytyczna**  | Jak (zalecane) - rekomendacje, dobre praktyki | Wytyczne Bezpiecznego Kodowania    |
| 5      | **Playbook**  | Jak (operacyjnie) - scenariusze, runbooki     | Playbook: Phishing Response        |


## Szablon dokumentu

Pełna struktura dokumentu: patrz [document-template.md](document-template.md).

## Treść merytoryczna

### Tagowanie klauzul

Każda klauzula musi mieć podstawę:

- `[REG:nazwa]` - wymóg regulacyjny (obowiązkowe)
- `[STD:nazwa]` - wymóg standardu (obowiązkowe jeśli standard wskazany)
- `[BP]` - best practice branżowa (zalecane)
- `[ORG]` - decyzja organizacyjna (specyficzna dla firmy)
- `[GEN]` - wiedza ogólna (wymaga review)

### Język dokumentu

- Polityki: "Organizacja MUSI...", "Pracownicy SĄ ZOBOWIĄZANI..."
- Standardy: "Wymagane jest...", "Minimalne wymaganie to..."
- Procedury: bezokolicznik lub tryb rozkazujący, krok po kroku
- Wytyczne: "Zaleca się...", "Rekomendowane jest..."

### Unikaj

- Ogólników bez treści ("należy dbać o bezpieczeństwo")
- Wymogów niemierzalnych ("odpowiedni poziom bezpieczeństwa" - jaki?)
- Skopiowanych fragmentów regulacji bez kontekstu organizacyjnego

### Dodawaj wartość

- Konkretne wymagania (np. "hasło min. 14 znaków" nie "silne hasło")
- Odpowiedzialności (kto robi co)
- Terminy (np. "przegląd co 12 miesięcy")
- Wyjątki i procedura ich uzyskania

## Format outputu

1. **Kompletny draft dokumentu** w Markdown z metadanymi (wg document-template.md)
2. **Lista klauzul `[GEN]`** do priorytetowej weryfikacji
3. **Blok PEWNOŚĆ**

## HARD STOP

> Ten dokument jest draftem wygenerowanym z pomocą AI. Wymaga przeglądu merytorycznego, prawnego (jeśli dotyczy regulacji) i formalnego zatwierdzenia zgodnie z procedurą organizacji. Tag `[GEN]` oznacza klauzule oparte na wiedzy ogólnej - zweryfikuj je priorytetowo.

