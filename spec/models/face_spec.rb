require 'rails_helper'

describe Face do
	it { should respond_to :name }
	it { should respond_to :agency }
end
