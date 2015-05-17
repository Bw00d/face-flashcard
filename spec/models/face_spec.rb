require 'rails_helper'

describe Face do
	it { should respond_to :name }
	it { should respond_to :agency }
	it { should validate_presence_of :name }
	it { should validate_presence_of :agency }
end
