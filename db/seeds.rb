class Seed
    def self.begin
        seed = Seed.new
        seed.generate_products
    end

    def generate_products
        10.times do |i|
            product = Product.create!(
                name: Faker::Appliance.brand,
                price: Faker::Number.decimal(l_digits: 2)
            )
            puts "Product #{i}: Name is #{product.name} and price is '#{product.price}'."
        end
    end
end

Seed.begin