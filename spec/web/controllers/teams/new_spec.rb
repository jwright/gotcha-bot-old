require 'spec_helper'
require_relative '../../../../apps/web/controllers/teams/new'

describe Web::Controllers::Teams::New do
  let(:action) { Web::Controllers::Teams::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
