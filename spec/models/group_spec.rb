require 'rails_helper'

describe Group, type: :model do
	let(:user1) { User.create email: 'test1@test.com', password: '123456' }
	let(:user2) { User.create email: 'test2@test.com', password: '654321' }
 it 'is not a valid group unless its name is unique' do
 	Group.create(name: "Team Boom", description: "Everything is awesome")
	group2 = Group.new(name: "Team Boom", description: "Everything is awesome")
	expect(group2).to have(1).error_on(:name)
 end

end
