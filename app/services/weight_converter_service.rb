class WeightConverterService
  # converting all units to grams
  GRAM_CONVERSION_RATES = {
    gram: 1.0,
    kilogram: 1000.0,
    cup: 128.0, # https://www.allrecipes.com/article/cup-to-gram-conversions/ according to this from cup to gram for dry goods
    teaspoons: 4.9289 # according to this https://metric-calculator.com/convert-tsp-to-g.htm
  }.with_indifferent_access

  REVERSE_RATE = {
    gram: 1.0,
    kilogram: 1 / 1000.0,
    cup: 1 / 128.0,
    teaspoons: 1 / 4.9289
  }.with_indifferent_access

  def self.weight_converter(converter_params)
    base_unit = converter_params[:base_unit]
    conversion_unit = converter_params[:conversion_unit]
    amount = converter_params[:amount]

    base_unit_in_gram = GRAM_CONVERSION_RATES[base_unit] * amount
    conversion_amount = (base_unit_in_gram * REVERSE_RATE[conversion_unit]).round(2)
    converter_params.merge(converted_amount: conversion_amount)
  end
end
