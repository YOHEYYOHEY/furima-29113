require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.create(:address)
  end

  describe '配送先入力' do
    context '配送先入力がうまくいくとき' do
      it '入力項目すべてが存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end
  end
end