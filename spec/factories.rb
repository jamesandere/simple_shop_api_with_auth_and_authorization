FactoryBot.define do
    brand = Brand.create(name: "Polo")
    factory(:product) do
        name {Faker::Appliance.brand}
        price {Faker::Number.decimal(l_digits: 2)}
        brand_id {brand.id}
    end
end