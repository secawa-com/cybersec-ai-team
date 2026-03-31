# Obsługa danych wrażliwych - CYBERSECTEAM

## Zasada ogólna

Framework jest neutralny wobec decyzji organizacji o poufności danych. Poniższe reguły chronią przed przypadkowym ujawnieniem, ale ostateczna decyzja o tym jakie dane mogą być przetwarzane przez AI należy do CISO.

## Klasyfikacja danych


| Kategoria         | Przykłady                                                         | Postępowanie                                                     |
| ----------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------- |
| **Publiczne**     | Nazwy frameworków, standardy, ogólne best practices               | Przetwarzaj swobodnie                                            |
| **Wewnętrzne**    | Struktura zespołu, lista projektów, ogólna architektura           | Przetwarzaj w ramach kontekstu organizacyjnego                   |
| **Poufne**        | Wyniki audytów, szczegóły incydentów, konfiguracje bezpieczeństwa | Przetwarzaj z ostrożnością, zaproponuj anonimizację outputów     |
| **Ściśle poufne** | Dane osobowe (PESEL, dane klientów), hasła, klucze, tokeny        | Ostrzeż użytkownika, zasugeruj anonimizację przed przetworzeniem |


## Automatyczne ostrzeżenia

Jeśli w tekście użytkownika lub plikach kontekstowych wykryjesz:

- **Numery PESEL, NIP, REGON** - ostrzeż
- **Imiona i nazwiska z kontekstem identyfikującym** (np. "Jan Kowalski z działu IT") - ostrzeż
- **Adresy email osób fizycznych** - ostrzeż
- **Adresy IP, nazwy hostów z kontekstem infrastruktury produkcyjnej** - poinformuj
- **Hasła, klucze API, tokeny** - NATYCHMIAST ostrzeż i zasugeruj usunięcie

Format ostrzeżenia:

> ⚠ DANE WRAŻLIWE: Wykryto [typ danych] w [lokalizacja]. Rozważ anonimizację przed dalszym przetwarzaniem lub udostępnianiem wyników.

## Anonimizacja outputów

Gdy użytkownik prosi o dokument do udostępnienia (raport, prezentacja, email):

1. Zaproponuj wersję zanonimizowaną
2. Użyj tokenów: `[ORG_1]`, `[PERSON_1]`, `[IP_1]`, `[HOST_1]`, `[FIN_1]`, `[LOC_1]`, `[SYS_1]`
3. Dołącz mapę encji na końcu (do wewnętrznego użytku)

## Czego NIE robić

- NIE odmawiaj przetwarzania danych na podstawie własnej oceny - decyzja należy do CISO
- NIE usuwaj danych z kontekstu bez pytania - możesz ostrzec, ale nie cenzuruj
- NIE zakładaj, że dane w plikach kontekstowych nie powinny tam być - CISO świadomie je umieścił

