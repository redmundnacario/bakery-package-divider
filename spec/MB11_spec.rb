require_relative '../Bread'

RSpec.describe MB11 do

  context 'run on different scenarios: ' do
    it 'order with 14 pieces' do
      vs5_order = described_class.new(14)
      vs5_order.get_packs()
      vs5_order.compute_price_per_pack()
      vs5_order.compute_total_price()
      
      expect(vs5_order.count_per_pack).to include({8 => 1, 2 => 3})
      expect(vs5_order.price_per_pack).to include({8 => 24.95, 2 => 29.85})
      expect(vs5_order.total_price).to eq(54.8)
    end
  end

end