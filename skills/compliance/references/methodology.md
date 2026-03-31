# Metodologia mapowania zgodności - CYBERSECTEAM

**Znajomość frameworków**: NIS2, DORA, ISO 27001:2022, RODO/GDPR, KSC, NIST CSF 2.0, CIS Controls v8

## Mapowanie kontrolek

Stwórz tabelę mapowania na podstawie governance.md:


| #   | Wymóg (artykuł/klauzula) | Opis wymogu | Istniejąca kontrola | Status | Luka | Priorytet |
| --- | ------------------------ | ----------- | ------------------- | ------ | ---- | --------- |


**Statusy:**

- ✅ **Zgodny** - kontrola istnieje, jest udokumentowana i wdrożona
- ⚠ **Częściowo zgodny** - kontrola istnieje ale jest niekompletna
- ❌ **Niezgodny** - brak kontroli lub poważne braki
- ❓ **Brak danych** - nie można ocenić bez dodatkowych informacji

## Identyfikacja luk

Dla każdego statusu ⚠ lub ❌:

1. **Co brakuje** - konkretnie, nie ogólnikowo
2. **Ryzyko niezgodności** - konsekwencje (kary, reputacja, operacyjne)
3. **Rekomendowana remediacja** - co zrobić
4. **Szacunkowy wysiłek** - niski / średni / wysoki
5. **Priorytet** - KRYTYCZNY / WYSOKI / ŚREDNI / NISKI

## Plan remediacji

Priorytetyzacja wg: ryzyko regulacyjne → operacyjne → quick wins → wysiłek.


| #   | Luka | Remediacja | Priorytet | Wysiłek | Odpowiedzialny | Termin |
| --- | ---- | ---------- | --------- | ------- | -------------- | ------ |


Kolumnę "Odpowiedzialny" wypełnij na podstawie team.md `[TEAM]` jeśli dostępny.

## Format outputu

1. **Tabela mapowania** kontrolek (format powyżej)
2. **Scorecard** - % zgodności per domena/sekcja
3. **Top 5 luk krytycznych** z rekomendacjami
4. **Quick wins** - co można zamknąć szybko
5. **Blok PEWNOŚĆ**

## Reguły specyficzne dla frameworków

### NIS2

- Artykuły 21 i 23 kluczowe (środki zarządzania ryzykiem + raportowanie incydentów)
- Art. 21(2) - 10 minimalnych środków bezpieczeństwa
- Kary: do 10M EUR lub 2% obrotu (podmioty kluczowe)
- WebSearch: zweryfikuj status transpozycji do prawa polskiego (KSC nowelizacja)

### DORA

- Dotyczy sektora finansowego
- Zarządzanie ryzykiem ICT (Art. 5-16), incydenty ICT (Art. 17-23), testowanie odporności (Art. 24-27), ryzyko stron trzecich (Art. 28-44)
- Obowiązuje od 17 stycznia 2025

### ISO 27001:2022

- 4 domeny Annex A: Organizacyjne (A.5), Ludzie (A.6), Fizyczne (A.7), Technologiczne (A.8)
- 93 kontrole w Annex A
- Nowe kontrole w 2022: threat intelligence, cloud security, data masking, monitoring activities

### RODO/GDPR

- Art. 32 - środki techniczne i organizacyjne
- Art. 33-34 - zgłaszanie naruszeń (72h do UODO)
- Art. 35 - DPIA
- Kary: do 20M EUR lub 4% obrotu

## Reguły tagowania

- ZAWSZE cytuj konkretne numery artykułów/klauzul z tagiem `[REG:...]` lub `[STD:...]`
- Gdy niepewny numeru → użyj WebSearch do weryfikacji
- Gdy nie możesz zweryfikować → napisz "zweryfikuj z aktualnym tekstem regulacji"
- Nie mieszaj wymagań różnych frameworków bez wyraźnego oznaczenia
- Cross-mapping (np. NIS2 → ISO 27001) jest wartościowy
- KSC to polska implementacja dyrektyw UE - zweryfikuj aktualny stan nowelizacji

## HARD STOP

> To jest przegląd ogólny oparty na dostępnych informacjach. Nie zastępuje formalnego audytu zgodności. W przypadku wątpliwości regulacyjnych - skonsultuj z radcą prawnym lub audytorem certyfikowanym.

