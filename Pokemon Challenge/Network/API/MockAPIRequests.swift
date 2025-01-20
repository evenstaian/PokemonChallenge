//
//  MockAPIRequests.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import Foundation

class MockAPIRequests: APIRequesting {
    
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkErrors>) -> Void) {
        let jsonString = """
        {
          "count": 1025,
          "next": "https://pokeapi.co/api/v2/pokemon-species?offset=20&limit=20",
          "previous": null,
          "results": [
            {
              "name": "bulbasaur",
              "url": "https://pokeapi.co/api/v2/pokemon-species/1/"
            },
            {
              "name": "ivysaur",
              "url": "https://pokeapi.co/api/v2/pokemon-species/2/"
            },
            {
              "name": "venusaur",
              "url": "https://pokeapi.co/api/v2/pokemon-species/3/"
            },
            {
              "name": "charmander",
              "url": "https://pokeapi.co/api/v2/pokemon-species/4/"
            },
            {
              "name": "charmeleon",
              "url": "https://pokeapi.co/api/v2/pokemon-species/5/"
            },
            {
              "name": "charizard",
              "url": "https://pokeapi.co/api/v2/pokemon-species/6/"
            },
            {
              "name": "squirtle",
              "url": "https://pokeapi.co/api/v2/pokemon-species/7/"
            },
            {
              "name": "wartortle",
              "url": "https://pokeapi.co/api/v2/pokemon-species/8/"
            },
            {
              "name": "blastoise",
              "url": "https://pokeapi.co/api/v2/pokemon-species/9/"
            },
            {
              "name": "caterpie",
              "url": "https://pokeapi.co/api/v2/pokemon-species/10/"
            },
            {
              "name": "metapod",
              "url": "https://pokeapi.co/api/v2/pokemon-species/11/"
            },
            {
              "name": "butterfree",
              "url": "https://pokeapi.co/api/v2/pokemon-species/12/"
            },
            {
              "name": "weedle",
              "url": "https://pokeapi.co/api/v2/pokemon-species/13/"
            },
            {
              "name": "kakuna",
              "url": "https://pokeapi.co/api/v2/pokemon-species/14/"
            },
            {
              "name": "beedrill",
              "url": "https://pokeapi.co/api/v2/pokemon-species/15/"
            },
            {
              "name": "pidgey",
              "url": "https://pokeapi.co/api/v2/pokemon-species/16/"
            },
            {
              "name": "pidgeotto",
              "url": "https://pokeapi.co/api/v2/pokemon-species/17/"
            },
            {
              "name": "pidgeot",
              "url": "https://pokeapi.co/api/v2/pokemon-species/18/"
            },
            {
              "name": "rattata",
              "url": "https://pokeapi.co/api/v2/pokemon-species/19/"
            },
            {
              "name": "raticate",
              "url": "https://pokeapi.co/api/v2/pokemon-species/20/"
            }
          ]
        }
    """
        
        generateJSONDataCompletion(jsonString: jsonString, completion: completion)
    }
    
    func getSpeciesDetails(id: Int, completion: @escaping (Result<SpeciesDetails, NetworkErrors>) -> Void) {
        let jsonString = """
        {
          "base_happiness": 50,
          "capture_rate": 45,
          "color": {
            "name": "green",
            "url": "https://pokeapi.co/api/v2/pokemon-color/5/"
          },
          "egg_groups": [
            {
              "name": "monster",
              "url": "https://pokeapi.co/api/v2/egg-group/1/"
            },
            {
              "name": "plant",
              "url": "https://pokeapi.co/api/v2/egg-group/7/"
            }
          ],
          "evolution_chain": {
            "url": "https://pokeapi.co/api/v2/evolution-chain/1/"
          },
          "evolves_from_species": null,
          "form_descriptions": [],
          "forms_switchable": false,
          "gender_rate": 1,
          "genera": [
            {
              "genus": "たねポケモン",
              "language": {
                "name": "ja-Hrkt",
                "url": "https://pokeapi.co/api/v2/language/1/"
              }
            },
            {
              "genus": "씨앗포켓몬",
              "language": {
                "name": "ko",
                "url": "https://pokeapi.co/api/v2/language/3/"
              }
            },
            {
              "genus": "種子寶可夢",
              "language": {
                "name": "zh-Hant",
                "url": "https://pokeapi.co/api/v2/language/4/"
              }
            },
            {
              "genus": "Pokémon Graine",
              "language": {
                "name": "fr",
                "url": "https://pokeapi.co/api/v2/language/5/"
              }
            },
            {
              "genus": "Samen-Pokémon",
              "language": {
                "name": "de",
                "url": "https://pokeapi.co/api/v2/language/6/"
              }
            },
            {
              "genus": "Pokémon Semilla",
              "language": {
                "name": "es",
                "url": "https://pokeapi.co/api/v2/language/7/"
              }
            },
            {
              "genus": "Pokémon Seme",
              "language": {
                "name": "it",
                "url": "https://pokeapi.co/api/v2/language/8/"
              }
            },
            {
              "genus": "Seed Pokémon",
              "language": {
                "name": "en",
                "url": "https://pokeapi.co/api/v2/language/9/"
              }
            },
            {
              "genus": "たねポケモン",
              "language": {
                "name": "ja",
                "url": "https://pokeapi.co/api/v2/language/11/"
              }
            },
            {
              "genus": "种子宝可梦",
              "language": {
                "name": "zh-Hans",
                "url": "https://pokeapi.co/api/v2/language/12/"
              }
            }
          ],
          "generation": {
            "name": "generation-i",
            "url": "https://pokeapi.co/api/v2/generation/1/"
          },
          "growth_rate": {
            "name": "medium-slow",
            "url": "https://pokeapi.co/api/v2/growth-rate/4/"
          },
          "habitat": {
            "name": "grassland",
            "url": "https://pokeapi.co/api/v2/pokemon-habitat/3/"
          },
          "has_gender_differences": false,
          "hatch_counter": 20,
          "id": 1,
          "is_baby": false,
          "is_legendary": false,
          "is_mythical": false,
          "name": "bulbasaur",
          "names": [
            {
              "language": {
                "name": "ja-Hrkt",
                "url": "https://pokeapi.co/api/v2/language/1/"
              },
              "name": "フシギダネ"
            },
            {
              "language": {
                "name": "roomaji",
                "url": "https://pokeapi.co/api/v2/language/2/"
              },
              "name": "Fushigidane"
            },
            {
              "language": {
                "name": "ko",
                "url": "https://pokeapi.co/api/v2/language/3/"
              },
              "name": "이상해씨"
            },
            {
              "language": {
                "name": "zh-Hant",
                "url": "https://pokeapi.co/api/v2/language/4/"
              },
              "name": "妙蛙種子"
            },
            {
              "language": {
                "name": "fr",
                "url": "https://pokeapi.co/api/v2/language/5/"
              },
              "name": "Bulbizarre"
            },
            {
              "language": {
                "name": "de",
                "url": "https://pokeapi.co/api/v2/language/6/"
              },
              "name": "Bisasam"
            },
            {
              "language": {
                "name": "es",
                "url": "https://pokeapi.co/api/v2/language/7/"
              },
              "name": "Bulbasaur"
            },
            {
              "language": {
                "name": "it",
                "url": "https://pokeapi.co/api/v2/language/8/"
              },
              "name": "Bulbasaur"
            },
            {
              "language": {
                "name": "en",
                "url": "https://pokeapi.co/api/v2/language/9/"
              },
              "name": "Bulbasaur"
            },
            {
              "language": {
                "name": "ja",
                "url": "https://pokeapi.co/api/v2/language/11/"
              },
              "name": "フシギダネ"
            },
            {
              "language": {
                "name": "zh-Hans",
                "url": "https://pokeapi.co/api/v2/language/12/"
              },
              "name": "妙蛙种子"
            }
          ],
          "order": 1,
          "pal_park_encounters": [
            {
              "area": {
                "name": "field",
                "url": "https://pokeapi.co/api/v2/pal-park-area/2/"
              },
              "base_score": 50,
              "rate": 30
            }
          ],
          "pokedex_numbers": [
            {
              "entry_number": 1,
              "pokedex": {
                "name": "national",
                "url": "https://pokeapi.co/api/v2/pokedex/1/"
              }
            },
            {
              "entry_number": 1,
              "pokedex": {
                "name": "kanto",
                "url": "https://pokeapi.co/api/v2/pokedex/2/"
              }
            },
            {
              "entry_number": 226,
              "pokedex": {
                "name": "original-johto",
                "url": "https://pokeapi.co/api/v2/pokedex/3/"
              }
            },
            {
              "entry_number": 231,
              "pokedex": {
                "name": "updated-johto",
                "url": "https://pokeapi.co/api/v2/pokedex/7/"
              }
            },
            {
              "entry_number": 80,
              "pokedex": {
                "name": "kalos-central",
                "url": "https://pokeapi.co/api/v2/pokedex/12/"
              }
            },
            {
              "entry_number": 1,
              "pokedex": {
                "name": "letsgo-kanto",
                "url": "https://pokeapi.co/api/v2/pokedex/26/"
              }
            },
            {
              "entry_number": 68,
              "pokedex": {
                "name": "isle-of-armor",
                "url": "https://pokeapi.co/api/v2/pokedex/28/"
              }
            },
            {
              "entry_number": 164,
              "pokedex": {
                "name": "blueberry",
                "url": "https://pokeapi.co/api/v2/pokedex/33/"
              }
            }
          ],
          "shape": {
            "name": "quadruped",
            "url": "https://pokeapi.co/api/v2/pokemon-shape/8/"
          },
          "varieties": [
            {
              "is_default": true,
              "pokemon": {
                "name": "bulbasaur",
                "url": "https://pokeapi.co/api/v2/pokemon/1/"
              }
            }
          ]
        }
        """
        
        generateJSONDataCompletion(jsonString: jsonString, completion: completion)
    }
    
    func getEvolutionChain(urlString: String, completion: @escaping (Result<EvolutionChainDetails, NetworkErrors>) -> Void) {
        let jsonString = """
        {
          "baby_trigger_item": null,
          "chain": {
            "evolution_details": [],
            "evolves_to": [
              {
                "evolution_details": [
                  {
                    "gender": null,
                    "held_item": null,
                    "item": null,
                    "known_move": null,
                    "known_move_type": null,
                    "location": null,
                    "min_affection": null,
                    "min_beauty": null,
                    "min_happiness": null,
                    "min_level": 16,
                    "needs_overworld_rain": false,
                    "party_species": null,
                    "party_type": null,
                    "relative_physical_stats": null,
                    "time_of_day": "",
                    "trade_species": null,
                    "trigger": {
                      "name": "level-up",
                      "url": "https://pokeapi.co/api/v2/evolution-trigger/1/"
                    },
                    "turn_upside_down": false
                  }
                ],
                "evolves_to": [
                  {
                    "evolution_details": [
                      {
                        "gender": null,
                        "held_item": null,
                        "item": null,
                        "known_move": null,
                        "known_move_type": null,
                        "location": null,
                        "min_affection": null,
                        "min_beauty": null,
                        "min_happiness": null,
                        "min_level": 32,
                        "needs_overworld_rain": false,
                        "party_species": null,
                        "party_type": null,
                        "relative_physical_stats": null,
                        "time_of_day": "",
                        "trade_species": null,
                        "trigger": {
                          "name": "level-up",
                          "url": "https://pokeapi.co/api/v2/evolution-trigger/1/"
                        },
                        "turn_upside_down": false
                      }
                    ],
                    "evolves_to": [],
                    "is_baby": false,
                    "species": {
                      "name": "venusaur",
                      "url": "https://pokeapi.co/api/v2/pokemon-species/3/"
                    }
                  }
                ],
                "is_baby": false,
                "species": {
                  "name": "ivysaur",
                  "url": "https://pokeapi.co/api/v2/pokemon-species/2/"
                }
              }
            ],
            "is_baby": false,
            "species": {
              "name": "bulbasaur",
              "url": "https://pokeapi.co/api/v2/pokemon-species/1/"
            }
          },
          "id": 1
        }
        """
        
        generateJSONDataCompletion(jsonString: jsonString, completion: completion)
    }
    
    func generateJSONDataCompletion<T: Decodable>(jsonString: String, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        let jsonData = jsonString.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(response))
        } catch let error {
            print(error)
            completion(.failure(.unknown))
        }
    }
}

