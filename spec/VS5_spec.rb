require_relative '../Bread'

RSpec.describe VS5 do

  context 'run on different scenarios: ' do
    it 'order with 10 pieces' do
      vs5_order = described_class.new(10)
      vs5_order.get_packs()
      vs5_order.compute_price_per_pack()
      vs5_order.compute_total_price()
      
      expect(vs5_order.count_per_pack).to include({5 => 2})
      expect(vs5_order.price_per_pack).to include({5 => 17.98})
      expect(vs5_order.total_price).to eq(17.98)
    end

    it 'order with 11 pieces' do
      vs5_order = described_class.new(11)
      vs5_order.get_packs()
      vs5_order.compute_price_per_pack()
      vs5_order.compute_total_price()
     
      expect(vs5_order.count_per_pack).to include({5 => 1, 3 => 2})
      expect(vs5_order.price_per_pack).to include({5 => 8.99, 3 => 13.98})
      expect(vs5_order.total_price).to eq(22.97)
    end
  end

end