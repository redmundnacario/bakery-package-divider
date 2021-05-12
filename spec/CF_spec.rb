require_relative '../Bread'

RSpec.describe CF do

  context 'run on different scenarios: ' do
    it 'order with 14 pieces' do
      vs5_order = described_class.new(13)
      vs5_order.get_packs()
      vs5_order.compute_price_per_pack()
      vs5_order.compute_total_price()
      
      expect(vs5_order.count_per_pack).to include({5 => 2, 3 => 1})
      expect(vs5_order.price_per_pack).to include({5 => 19.9, 3 => 5.95})
      expect(vs5_order.total_price).to eq(25.85)
    end
  end

end