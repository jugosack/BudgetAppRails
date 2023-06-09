require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, name: 'user', email: 'user@mail.com', password: '123456') }
  let(:group) { Group.create(id: 2, name: 'Shopping', icon: 'Shopping', author_id: user.id) }
  let(:entity) { Entity.create(id: 1, name: 'Dress', amount: 12, author_id: user.id, group_id: group.id) }

  describe 'Entity validations' do
    context 'when valid' do
      it { expect(entity).to be_valid }
    end

    it 'Without name it is invalid ' do
      entity.name = nil
      expect(entity).to_not be_valid
    end
  end
end
