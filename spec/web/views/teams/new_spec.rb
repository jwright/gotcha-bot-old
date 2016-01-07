require 'spec_helper'
require_relative '../../../../apps/web/views/teams/new'

describe Web::Views::Teams::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/teams/new.html.erb') }
  let(:view)      { Web::Views::Teams::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
