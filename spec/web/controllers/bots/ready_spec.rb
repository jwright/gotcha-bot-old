require 'spec_helper'
require_relative '../../../../apps/web/controllers/bots/ready'

describe Web::Controllers::Bots::Ready do
  let(:action) { Web::Controllers::Bots::Ready.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
