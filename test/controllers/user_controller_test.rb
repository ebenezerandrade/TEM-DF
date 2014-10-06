require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  	
    def setup
      @user = users(:Roberto)
    end

    test "should get index" do
  		get :index
    	assert_response :success
    	assert_not_nil assigns(:users)
  	end

  	test "should get new" do
  		get :new
  		assert_response :success
  	end

  	test "should create user" do
  		assert_difference('User.count') do
            post :create, user: {username: "test", email: "test@test.com", password: "test", password_confirmation: "test"}
    	end

    	assert_redirected_to root_path(assigns(:user))
  	end

      #linha 15
    test "shouldn't create user" do
        assert_no_difference('User.count') do
            post :create, user: {username: "test", email: "test", password: "test", password_confirmation: "test"}
        end

        assert_template :new
    end

    test "shouldn't create user if passwords are different" do
        assert_no_difference('User.count') do
            post :create, user: {username: "test", email: "test@test.com", password: "test1", password_confirmation: "test" }
        end

        assert_template :new
    end

    test "should create user with document" do
        assert_difference('User.count') do
            post :create, user: {username: "test", email: "test@test.com", password: "test", password_confirmation: "test", 
                document: fixture_file_upload('files/arquivo_medico', 'application/pdf')}
        end

        assert_redirected_to root_path(assigns(:user))
    end

    test "should destroy user" do
        assert_difference('User.count', -1) do
            delete :destroy, id: @user.id
        end
        assert_redirected_to(:controller => "users", :action => "index")
    end 
end
