def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_2
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'testtest2')
  fill_in('Password confirmation', with: 'testtest2')
  click_button('Sign up')
end

def create_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def create_review
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in "Thoughts", with: "so so"
  select '3', from: 'Rating'
  click_button 'Leave Review'
end
