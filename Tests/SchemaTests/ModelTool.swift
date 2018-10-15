//
//  ModelTool.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import OpenCannabis
import Bloombox


internal struct ModelTool {
  static func generateTestModel() -> Flower {
    return Flower.with { flower in
      let now = TemporalInstant.with { now in
        now.timestamp = UInt64(Date().timeIntervalSince1970)
      }

      // Root: Product Key
      flower.key = ProductKey.with { key in
        key.id = "abc123"
        key.type = .flowers
      }

      // Root: Product Content
      flower.product = ProductContent.with { product in
        product.name = Name.with { $0.primary = "Animal Crackers" }

        // Content: Brand
        product.brand = Brand.with { brand in
          brand.name = Name.with { $0.primary = "Speciale" }
          brand.summary = Content.with { content in
            content.encoding = Content.Encoding.utf8
            content.language = Language.english
            content.content = "We focus on quality above all else"
          }
        }

        // Content: Summary
        product.summary = Content.with { summary in
          summary.encoding = Content.Encoding.utf8
          summary.language = Language.english
          summary.content = ("This strain provides a nice, comfortable high, with very little anxiety or other " +
                             "negative effects. Combined with a morning coffee, it is a treat.")
        }

        // Content: Dosage
        product.dosage = Content.with { dosage in
          dosage.encoding = Content.Encoding.b64
          dosage.language = Language.english
          dosage.content = ("Only a few bowls should do you fine. Mostly we're trying to test b64 content here."
            .data(using: .utf8)!.base64EncodedString())
        }

        // Content: Timestamps
        product.ts = ProductTimestamps.with { ts in
          ts.created = now
          ts.modified = now
        }

        // Content: Testing
        product.tests = TestResults.with { tests in
          tests.available = true
          tests.sealed = now
          tests.lastUpdated = now

          // Tests: Aroma Summary
          tests.aroma = [
            TasteNote.citrus,
            TasteNote.pine,
            TasteNote.sweet,
            TasteNote.earth
          ]

          // Tests: Coordinates
          tests.coordinates = TestCoordinates.with { coords in
            coords.batch = "ABC-123"
            coords.lot = "LOT1"
            coords.sampleID = "SAMPLE-ID-123"
          }

          // Tests: Subjective
          tests.subjective = Subjective.with { subj in
            subj.feeling = [
              Feeling.calming,
              Feeling.focus,
              Feeling.grounding
            ]
            subj.aroma = [
              TasteNote.citrus,
              TasteNote.earth
            ]
            subj.potency = PotencyEstimate.heavy
            subj.description_p = Content.with { subjDesc in
              subjDesc.content = "Calm, alert high, with minimal anxiety but just a little bit of brain fuzz."
              subjDesc.language = Language.english
              subjDesc.encoding = Content.Encoding.utf8
            }
          }

          // Tests: Cannabinoids
          tests.cannabinoids = Cannabinoids.with { canna in
            canna.thc = TestValue.with { $0.measurement = 34.1; $0.type = TestValueType.percentage }
            canna.cbd = TestValue.with { $0.measurement = 4.2; $0.type = TestValueType.percentage }
            canna.potency = PotencyEstimate.medium
            canna.ratio = CannabinoidRatio.thcOverCbd
            canna.results = [
              Cannabinoids.Result.with { thc in
                thc.cannabinoid = .thc
                thc.measurement = TestValue.with { $0.measurement = 34.1; $0.type = TestValueType.percentage }
              },

              Cannabinoids.Result.with { cbd in
                cbd.cannabinoid = .cbd
                cbd.measurement = TestValue.with { $0.measurement = 4.2; $0.type = TestValueType.percentage }
              },

              Cannabinoids.Result.with { thcv in
                thcv.cannabinoid = .thcV
                thcv.measurement = TestValue.with { $0.measurement = 8.1; $0.type = TestValueType.percentage }
              },

              Cannabinoids.Result.with { cbda in
                cbda.cannabinoid = .cbdA
                cbda.measurement = TestValue.with { $0.measurement = 1.2; $0.type = TestValueType.percentage }
              }
            ]
          }

          // Tests: Moisture
          tests.moisture = Moisture.with { moist in
            moist.measurement = TestValue.with { $0.measurement = 0.006; $0.type = TestValueType.percentage }
          }

          // Tests: Media
          tests.media = [
            TestMedia.with { labReport in
              labReport.type = TestMediaType.results
              labReport.mediaItem = MediaItem.with { media in
                media.key = MediaKey.with { $0.id = "labreport-123.pdf" }
                media.uri = "https://cdn-host-bla-bla.com/labreport-123.pdf"
              }
            },

            TestMedia.with { labCOA in
              labCOA.type = TestMediaType.certificate
              labCOA.mediaItem = MediaItem.with { media in
                media.key = MediaKey.with { $0.id = "labcoa-123.pdf" }
                media.uri = "https://cdn-host-bla-bla.com/labcoa-123.pdf"
              }
            },

            TestMedia.with { labImage in
              labImage.type = TestMediaType.productImage
              labImage.mediaItem = MediaItem.with { media in
                media.key = MediaKey.with { $0.id = "cookies-img-0123.png" }
                media.uri = "https://cdn-host-bla-bla.com/cookies-img-0123.png"
              }
            }
          ]

          // Tests: Contaminants
          tests.contaminants = Contaminants.with { contaminants in
            contaminants.metals = Metals.with { metals in
              metals.measurements = [
                "metal1": TestValue.with { $0.measurement = 0.0023; $0.type = TestValueType.percentage },
                "metal2": TestValue.with { $0.present = true; $0.type = TestValueType.presence },
                "metal3": TestValue.with { $0.present = false; $0.type = TestValueType.presence }
              ]
            }

            contaminants.moldMildew = MoldMildew.with { moldMildew in
              moldMildew.moldMildewFree = true
            }

            contaminants.pesticides = Pesticides.with { pesticides in
              pesticides.pesticideFree = true
            }
          }

          // Tests: Terpenes
          tests.terpenes = Terpenes.with { terps in
            terps.available = true
            terps.aroma = [
              TasteNote.pine,
              TasteNote.sweet,
              TasteNote.floral
            ]
            terps.feeling = [
              Feeling.calming,
              Feeling.grounding
            ]
            terps.terpene = [
              Terpenes.Result.with { alphaPinene in
                alphaPinene.terpene = Terpene.alphaPinene
                alphaPinene.measurement = TestValue.with { $0.measurement = 0.671; $0.type = TestValueType.percentage }
              },

              Terpenes.Result.with { betaCaryo in
                betaCaryo.terpene = Terpene.betaCaryophyllene
                betaCaryo.measurement = TestValue.with { $0.measurement = 0.584; $0.type = TestValueType.percentage }
              },

              Terpenes.Result.with { myr in
                myr.terpene = Terpene.myrcene
                myr.measurement = TestValue.with { $0.measurement = 0.443; $0.type = TestValueType.percentage }
              },

              Terpenes.Result.with { alphaTerp in
                alphaTerp.terpene = Terpene.alphaTerpinine
                alphaTerp.measurement = TestValue.with { $0.measurement = 0.372; $0.type = TestValueType.percentage }
              },

              Terpenes.Result.with { carene in
                carene.terpene = Terpene.carene
                carene.measurement = TestValue.with { $0.measurement = 0.341; $0.type = TestValueType.percentage }
              },

              Terpenes.Result.with { euca in
                euca.terpene = Terpene.eucalyptol
                euca.measurement = TestValue.with { $0.measurement = 0.282; $0.type = TestValueType.percentage }
              }
            ]
          }
        }

        // Content: Pricing
        product.pricing = ProductPricing.with { pricing in
          // Pricing: Gram
          pricing.manifest = [
            Pricing.with { manifest in
              manifest.type = PricingType.weighted
              manifest.weighted = WeightedPricing.with { gram in
                gram.weight = PricingWeightTier.gram
                gram.tier = UnitPricing.with { item in
                  item.status = PricingTierAvailability.with { tier in
                    tier.available = true
                    tier.offered = true
                  }

                  item.price = CurrencyValue.with { price in
                    price.fiat = FiatCurrency.usd
                    price.value = 18.0
                  }
                }
              }
            },

            // Pricing: Eighth
            Pricing.with { manifest in
              manifest.type = PricingType.weighted
              manifest.weighted = WeightedPricing.with { eighth in
                eighth.weight = PricingWeightTier.eighth
                eighth.tier = UnitPricing.with { item in
                  item.status = PricingTierAvailability.with { tier in
                    tier.available = true
                    tier.offered = true
                  }

                  item.price = CurrencyValue.with { price in
                    price.fiat = FiatCurrency.usd
                    price.value = 55.0
                  }
                }
              }
            },

            // Pricing: Quarter
            Pricing.with { manifest in
              manifest.type = PricingType.weighted
              manifest.weighted = WeightedPricing.with { quarter in
                quarter.weight = PricingWeightTier.eighth
                quarter.tier = UnitPricing.with { item in
                  item.status = PricingTierAvailability.with { tier in
                    tier.available = false
                    tier.offered = true
                  }

                  item.price = CurrencyValue.with { price in
                    price.fiat = FiatCurrency.usd
                    price.value = 105.0
                  }
                }
              }
            },

            // Pricing: Half
            Pricing.with { manifest in
              manifest.type = PricingType.weighted
              manifest.weighted = WeightedPricing.with { quarter in
                quarter.weight = PricingWeightTier.eighth
                quarter.tier = UnitPricing.with { item in
                  item.status = PricingTierAvailability.with { tier in
                    tier.available = false
                    tier.offered = true
                  }

                  item.price = CurrencyValue.with { price in
                    price.fiat = FiatCurrency.usd
                    price.value = 205.0
                  }
                }
              }
            },

            // Pricing: Ounce
            Pricing.with { manifest in
              manifest.type = PricingType.weighted
              manifest.weighted = WeightedPricing.with { quarter in
                quarter.weight = PricingWeightTier.eighth
                quarter.tier = UnitPricing.with { item in
                  item.status = PricingTierAvailability.with { tier in
                    tier.available = false
                    tier.offered = true
                  }

                  item.price = CurrencyValue.with { price in
                    price.fiat = FiatCurrency.usd
                    price.value = 400.0
                  }
                }
              }
            }
          ]
        }
      }

      // Root: Material Data
      flower.material = MaterialsData.with { material in
        material.grow = .indoor
        material.species = .hybridSativa
        material.shelf = .topshelf

        // Materials: Distribution
        material.channel = [
          DistributionPolicy.with { policy in
            policy.channel = .retail
            policy.type = .direct
            policy.enabled = true
          },

          DistributionPolicy.with { policy in
            policy.channel = .wholesale
            policy.type = .direct
            policy.enabled = true
          }
        ]

        // Materials: Genetics
        material.genetics = Genetics.with { genetics in
          genetics.male = ProductReference.with { ref in
            ref.name = Name.with { $0.primary = "Cookie Creek" }
            ref.key = ProductKey.with { maleKey in
              maleKey.id = "abc122"
              maleKey.type = .flowers
            }
          }

          genetics.female = ProductReference.with { ref in
            ref.name = Name.with { $0.primary = "OG Legend" }
            ref.key = ProductKey.with { maleKey in
              maleKey.id = "abc121"
              maleKey.type = .flowers
            }
          }
        }
      }
    }
  }

  static func generateInventoryProduct(forWeightTier tier: PricingWeightTier = .eighth) -> InventoryProduct {
    return InventoryProduct.with { product in
      let now = TemporalInstant.with { $0.timestamp = UInt64(Date().timeIntervalSince1970) }

      let flower = generateTestModel()
      product.key = InventoryKey.with { key in
        key.uuid = UUID().uuidString.uppercased()
      }

      product.item = MenuProduct.with { item in
        item.flower = flower
      }

      product.state = InventoryState.with { state in
        state.amount = InventoryAmount.with { amount in
          amount.weight = tier
          amount.quantity = 15
          amount.type = .weighted
        }

        state.coordinates = InventoryCoordinates.with { coords in
          coords.rack = "12"
          coords.shelf = "3"
          coords.bin = "B1234"
          coords.batch = "ABC-123"
        }

        state.fitForSale = true
        state.created = now
        state.modified = now
      }

      product.sku = [
        "SKABC123-\(tier.rawValue)",
        "ALT123-\(tier.rawValue)"
      ]

      product.variant = [
        VariantSpec.with { $0.weight = .eighth }
      ]
    }
  }

  static func generateFullInventorySuite() -> [InventoryProduct] {
    // generate an inventory set for every weight for flowers
    let tiers: [PricingWeightTier] = [.gram, .eighth, .quarter, .half, .ounce]
    var productInventory: [InventoryProduct] = []

    for tier in tiers {
      productInventory.append(self.generateInventoryProduct(forWeightTier: tier))
    }
    return productInventory
  }

  static func generateInventory(_ strainCount: Int = 1) -> [InventoryProduct] {
    var productSets: [InventoryProduct] = []
    for _ in 0...strainCount {
      productSets.append(contentsOf: self.generateFullInventorySuite())
    }
    return productSets
  }
}
