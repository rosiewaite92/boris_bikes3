require "bike"
describe Bike do
  it {should respond_to(:working?)}

  it 'a bike should be reported broken' do
    subject.report_broken
    expect(subject).not_to be_working
  end
end 