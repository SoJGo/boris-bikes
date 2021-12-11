require 'bike'

describe Bike do
  it 'can be reported as broken' do
    subject.report_broken
    expect(subject).to_not be_working
  end
end