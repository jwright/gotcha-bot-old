require 'spec_helper'
require_relative '../../../../apps/web/views/bots/ready'

describe Web::Views::Bots::Ready do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/bots/ready.html.erb') }
  let(:view)      { Web::Views::Bots::Ready.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
