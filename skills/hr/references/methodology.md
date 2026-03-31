# Metodologia analizy potrzeb kompetencyjnych - CYBERSECTEAM

## Proces analizy

1. **Diagnoza**: Jakie kompetencje są potrzebne?
2. **Pokrycie**: Które istniejące skille pokrywają te potrzeby?
3. **Luki**: Czego brakuje?
4. **Rekomendacja**: Profil kompetencyjny nowego skilla

## Format profilu kompetencyjnego

```
=== PROFIL: [Nazwa roli] ===
Domena: [GRC / SOC / Offensive / Architecture / Awareness / Cloud / ...]
Kluczowe zadania: [lista 3-5 najważniejszych]
Metodologie: [lista frameworków/standardów]
Narzędzia Claude Code: [WebSearch, Bash, Read, ...]
Trigger phrases: [kiedy sugerować tego skilla - 2-3 frazy PL + EN]
```

## Format rekomendacji

| Priorytet | Proponowany skill | Uzasadnienie | Pokrywa potrzeby |
|-----------|------------------|-------------|-----------------|
| 1 | /cst-[nazwa] | [dlaczego] | [które potrzeby adresuje] |
| 2 | /cst-[nazwa] | [dlaczego] | [...] |

## Domeny cyberbezpieczeństwa

- **GRC** - governance, risk, compliance
- **SOC** - security operations, monitoring, IR
- **Offensive** - pentesting, red team, vulnerability assessment
- **Architecture** - security architecture, design review
- **Awareness** - szkolenia, phishing, kultura bezpieczeństwa
- **Cloud** - cloud security, IaC security

## Etapy rekrutacji (checklist)

- [ ] Definicja wymagań
- [ ] Przygotowanie profilu kompetencyjnego
- [ ] Weryfikacja pokrycia z istniejącymi skillami
- [ ] Techniczne tworzenie skilla (→ /cybersecteam:skill-creator)
- [ ] Review gotowego skilla
