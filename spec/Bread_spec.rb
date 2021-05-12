require_relative '../Bread'

RSpec.describe Bread do

  context 'run on different scenarios: ' do
    it 'create new bread' do
      vs5_order = described_class.new("tinapay",3, prices ={2 => 3, 1 => 2})
      vs5_order.get_packs()
      vs5_order.compute_price_per_pack()
      vs5_order.compute_total_price()
      
      expect(vs5_order.count_per_pack).to include({2 => 1, 1 => 1})
      expect(vs5_order.price_per_pack).to include({2 => 3, 1 => 2})
      expect(vs5_order.total_price).to eq(5)
    end
  end

end