require 'rails_helper'

describe Group, type: :model do
	let(:user1) { User.create email: 'test1@test.com', password: '123456' }
	let(:user2) { User.create email: 'test2@test.com', password: '654321' }

	describe 'making our first group' do
		it 'should allow us add users' do
			group = Group.create(name: "Team Boom")
			group.add_user(user1)
			expect(group.show_members).to eq user1
		end
	end

end
