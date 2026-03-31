# Metodologia oceny ryzyka - CYBERSECTEAM

**Standardy**: ISO 27005, NIST RMF (SP 800-30), FAIR (opcjonalnie, do analizy ilościowej)
**Odwołania**: MITRE ATT&CK (zagrożenia techniczne), NIST CSF (kontrole)

### Kiedy użyć FAIR
FAIR (Factor Analysis of Information Risk) stosuj opcjonalnie gdy użytkownik potrzebuje analizy ilościowej (wartości finansowe): szacunkowa roczna strata (ALE), prawdopodobieństwo zdarzenia w ciągu roku (LEF), pojedyncza strata (SLE). Domyślnie używaj macierzy jakościowej (4×4).

## Identyfikacja ryzyk

**Aktywa** (co chronimy):
- Zidentyfikuj z kontekstu organizacyjnego `[ORG]` `[STRAT]`
- Uzupełnij wiedzą ogólną `[GEN]` jeśli potrzeba

**Zagrożenia** (co może się stać):
- Zewnętrzne (cyberprzestępcy, APT, supply chain)
- Wewnętrzne (insiderzy, błędy, zaniedbania)
- Środowiskowe (awarie, katastrofy)
- Tag: `[ORG]` / `[GOV]` / `[STRAT]` jeśli z kontekstu, `[GEN]` jeśli z wiedzy ogólnej

**Podatności** (co ułatwia zagrożenie):
- Techniczne (brak patchy, misconfiguration)
- Organizacyjne (brak polityk, niedobory kadrowe)
- Procesowe (brak procedur, brak testów)

## Analiza ryzyka

Dla każdego ryzyka:

| Element | Opis |
|---------|------|
| **Ryzyko** | [opis scenariusza] |
| **Zagrożenie** | [źródło zagrożenia] |
| **Podatność** | [co jest eksploatowane] |
| **Prawdopodobieństwo** | NISKIE / ŚREDNIE / WYSOKIE / BARDZO WYSOKIE - z uzasadnieniem i tagiem |
| **Wpływ** | NISKI / ŚREDNI / WYSOKI / KRYTYCZNY - finansowy, operacyjny, reputacyjny, regulacyjny |
| **Poziom ryzyka** | Prawdopodobieństwo × Wpływ (macierz 4×4 poniżej) |
| **Istniejące kontrole** | Jakie mechanizmy już istnieją `[GOV]` |

### Macierz 4×4

|  | NISKI wpływ | ŚREDNI wpływ | WYSOKI wpływ | KRYTYCZNY wpływ |
|--|-------------|-------------|-------------|-----------------|
| **B. WYSOKIE p-stwo** | ŚREDNI | WYSOKI | KRYTYCZNY | KRYTYCZNY |
| **WYSOKIE p-stwo** | NISKI | ŚREDNI | WYSOKI | KRYTYCZNY |
| **ŚREDNIE p-stwo** | NISKI | ŚREDNI | ŚREDNI | WYSOKI |
| **NISKIE p-stwo** | NISKI | NISKI | ŚREDNI | ŚREDNI |

## Opcje postępowania

Dla każdego ryzyka WYSOKIEGO lub KRYTYCZNEGO:

1. **Mitygacja** - jakie kontrole wdrożyć:
   - Konkretne działanie + szacunkowy wysiłek (niski/średni/wysoki)
   - Odwołanie do standardu `[STD:ISO27001 A.x.x]` lub `[STD:NIST CSF xx.xx]`
   - Priorytet wdrożenia: natychmiast / kwartał / rok

2. **Akceptacja** - kiedy ma sens:
   - Ryzyko poniżej apetytu na ryzyko organizacji
   - Koszt mitygacji nieproporcjonalny do potencjalnej straty
   - Wymagany: formalny zapis decyzji z podpisem risk ownera

3. **Transfer** - przeniesienie ryzyka:
   - Ubezpieczenie cyber (zakres, wyłączenia)
   - Outsourcing do MSSP/SOCaaS
   - Klauzule umowne z dostawcami

4. **Unikanie** - rezygnacja z działania:
   - Kiedy ryzyko jest nieakceptowalne i brak efektywnej mitygacji
   - Alternatywne podejścia z niższym ryzykiem

## Ryzyko rezydualne

Po zaproponowaniu mitygacji - oszacuj ryzyko rezydualne.

## Format outputu

1. **Tabela ryzyk**:

| Ryzyko | Zagrożenie | Podatność | P-stwo | Wpływ | Poziom | Rekomendacja |
|--------|-----------|-----------|--------|-------|--------|-------------|

2. **Top 3-5 rekomendacji** z priorytetyzacją
3. **Blok PEWNOŚĆ** (WYSOKA/ŚREDNIA/NISKA + źródła + ograniczenia)

## Threat intelligence

Dla każdej oceny ryzyka OBOWIĄZKOWO zweryfikuj aktualne zagrożenia przez WebSearch:

### Kiedy szukać
- **Zawsze**: aktualne kampanie i TTPs dla branży/sektora klienta
- **Jeśli wymieniono technologie**: znane CVE i exploity (ostatnie 12 miesięcy)
- **Jeśli dotyczy supply chain**: incydenty u dostawców danej klasy (SaaS, cloud, managed services)
- **Jeśli dotyczy regulacji**: ostatnie zmiany regulacyjne i kary w sektorze

### Źródła do przeszukania
- CERT Polska (cert.pl) - alerty i raporty
- ENISA Threat Landscape - roczny raport zagrożeń
- MITRE ATT&CK - TTPs dla zidentyfikowanych zagrożeń
- NVD/CVE - podatności dla wymienionych technologii
- Raporty branżowe (Verizon DBIR, Mandiant M-Trends, CrowdStrike Global Threat Report)

### Jak tagować
- Każdy wynik WebSearch taguj jako `[WEB]` z podaniem URL źródła
- Jeśli WebSearch niedostępny - pomiń, oznacz w bloku PEWNOŚĆ jako ograniczenie
- NIE fabrykuj wyników wyszukiwania - jeśli nie znalazłeś, napisz "nie znaleziono aktualnych danych"

## HARD STOP

> Wartości prawdopodobieństwa i wpływu są ilustracyjne. Faktyczne scorowanie wymaga kalibracji z apetytem na ryzyko Twojej organizacji i danymi historycznymi.

## Reguły tagowania

- Każdy czynnik ryzyka taguj źródłem wg systemu tagów z anti-hallucination.md: `[ORG]`, `[GOV]`, `[STRAT]` jeśli z plików organizacyjnych, `[GEN]` jeśli z wiedzy ogólnej
- Nie wymyślaj zagrożeń specyficznych dla organizacji jeśli nie masz danych - oznacz je jako `[GEN]`
- Preferuj macierz ryzyka (tabelę) nad długi tekst opisowy
- Używaj WebSearch do weryfikacji aktualnych zagrożeń i trendów threat intelligence
