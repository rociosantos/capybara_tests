require "test_helper"

class CanAccessHomeTest
  describe 'google home' do
    it 'must be able to access google home page' do
      visit '/'
      binding.pry
      assert page.has_content?("Google")
    end
  end
end
