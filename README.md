## ESS Election Dates

The [European Social Survey](https://www.europeansocialsurvey.org/) (ESS) prompts respondents' to recall their vote choice in the most recent national election. As the ESS is a pan-European bienniel social survey whose fieldwork periods do not follow electoral calendars (unlike European or national election studies), this can result in some challenges for comparative voting research across electoral contexts:

1. *Several consecutive ESS rounds may record respondents' voting behavior in one and the same election.* In Belgium, for example, ESS Rounds 7 (fieldwork period: 2014-09-16 to 2015-02-01), 8 (2016-09-15 to 2017-01-31) and 9 (2018-09-20 to 2019-01-27) all record vote choices in the general election of 2014-05-25.
1. *The vote choice question in ESS rounds may be split if a national election takes places during the ESS fieldwork period.* For instance, the 2012 Dutch general election took place on 2012-09-12, thus splitting Round 6 (fieldwork period: 2012-08-30 to 2013-03-29). The [Dutch Round 6 questionnaire](https://www.europeansocialsurvey.org/docs/round6/fieldwork/netherlands/ESS6_questionnaires_NL.pdf) specifically asks for respondents' vote recall in the general election of September 2012. However, 257 respondents were interviewed before election day and the data includes vote choice information for these respondents (presumably their vote choice in the previous general election of 2010).

In order to address research questions that require information on the political, socio-economic, or temporal contexts under which individuals cast their votes (studying, e.g., the effects of parties' position taking, issue salience in electoral campaigns, or pre-/post-differences after crises or critical events), it is important that users accurately match ESS vote choice data with the correct election dates. 

**ESS Election Dates** allows users to do this by simply matching election dates to ESS country-waves using the ESS' `cntry` and `essround` identifiers. In the case of split rounds, users must additionally use the idiosyncratic interview dates, captured by a combination of the variables `inwyr`-`inwmm`-`inwdd` (year/month/day of interview, ESS Rounds 1 + 2), `inwyys`-`inwmms`-`inwdds` (year/month/day of interview start, ESS Rounds 3-9), or `inwyye`-`inwmme`-`inwdde` (year/month/day of interview end, ESS Rounds 3-9).

Used together with [Sophie E. Hill](https://twitter.com/sophie_e_hill)'s updated [ESS-Partyfacts Crosswalk](https://github.com/sophieehill/ess-partyfacts-crosswalk), this resource will allow users to quickly combine ESS vote choice data with party, election, and party-election specific variables for most countries across Rounds 1-9. Election dates were taken from [ParlGov](http://www.parlgov.org/), thus coverage is contingent on the inclusion of countries in the ParlGov data base. 

## Codebook

| Variable                         | Description                                                                                      |
|----------------------------------|--------------------------------------------------------------------------------------------------|
| `cntry`                          | ISO2C country code (as used in ESS)                                                              |
| `essround`                       | ESS Round                                                                                        |
| `field_start`                    | Start date of first interview in each country-wave                                               |
| `field_end`                      | Start date of last interview in each country-wave                                                |
| `recent_election`                | Date of the most recent election                                                                 |
| `max_days_since_election`        | Number of days between most recent election and last interview                                   |
| `split_wave`                     | General election during fieldwork period (TRUE/FALSE)                                            |
| `recent_election_split1`         | Date of the most recent election for respondents interviewed before election day in a split wave |
| `max_days_since_election_split1` | Number of days between the last election and the last pre-election interview in a split wave     |
