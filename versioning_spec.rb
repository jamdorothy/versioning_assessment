require_relative './versioning'

describe Versioning do
  it "first number is not 9 or 0, other digits are not all nines" do
    input = "6.8.9"
    expected = "6.9.0"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number is not 9 or 0, other digits are all nines" do
    input = "6.9.9"
    expected = "7.0.0"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number is 0, other digits are not all nines" do
    input = "0.3.5"
    expected = "0.3.6"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number is 0, all other digits are nines" do
    input = "0.9.9.9"
    expected = "1.0.0.0"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number is 9, other digits are not all nines" do
    input = "9.7.4"
    expected = "9.7.5"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number is 9, all other digits are nines" do
    input = "9.9.9"
    expected = "10.0.0"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number has more than 1 digit, other digits are not all nines" do
    input = "13.0.7"
    expected = "13.0.8"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end

  it "first number has more than 1 digit, all other digits are nines" do
    input = "12.9.9"
    expected = "13.0.0"
    actual = Versioning.increment_version_number(input)
    expect(actual).to eq(expected)
  end
end
