# Feature: New Face page
#   As a user
#   I add faces to the site
#   So I can lean them
feature 'New Face page' do

  # Context: Visit the new face page
  #   Given I am a user
  #   When I visit the new face page
  #   Then I see "Add a Face"
  context 'visiting the new face page' do
    before { visit new_face_path }
    
  	it "should have the right title" do
	    expect(page).to have_title 'New Face'
  	end
  	it "should have a new face form" do
	    expect(page).to have_content 'Add a Face'
	  end
  end
end

# Feature: Face show page
#   As a user
#   I view individual faces
#   So I can lean them
describe 'Face show page' do

  describe 'visiting a face show page' do
    let!(:face) { FactoryGirl.create(:face) }
    before { visit faces_path(face) }
    it 'should have the right title' do
      expect(page).to have_title "Jack Sharp"
    end
  end
end