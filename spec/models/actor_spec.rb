require 'rails_helper'
require 'byebug'

RSpec.describe Actor, type: :model do
  subject(:actor) { Actor.find_by(name: "Uma Thurman")}


  it "has a casting " do
    expect(actor.castings.first.actor_id).to eq(actor.id)
  end

  # it "has a membership" do
  #   larry_id = Executive.find_by_name("Larry Page").id
  #   expect(actor.memberships.first.actor_id).to eq(actor.id)
  #   expect(actor.memberships.first.member_id).to eq(larry_id)
  # end
  # 
  # it "has a member" do
  #   expect(actor.members.first.name).to eq("Larry Page")
  # end
  # 
  # it "has a single exchange" do
  #   nasdaq = Exchange.find_by_name("NASDAQ")
  #   expect(actor.exchange).to eq(nasdaq)
  # end


end
