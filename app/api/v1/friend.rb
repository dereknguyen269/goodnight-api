class V1::Friend < Grape::API
  helpers V1::Helpers

  resource :friends do
    desc 'List Followings', entity: Entities::V1::User
    get do
      user_authenticate!
      present current_user.all_following, with: Entities::V1::User
    end

    desc 'Follow Other User', entity: Entities::V1::User
    post "follow/:user_id" do
      user_authenticate!
      friend = User.find params[:user_id]
      if current_user.following?(friend)
        error!("You already follow them!", 405)
      else
        current_user.follow(friend)
        status 200
        present friend, with: Entities::V1::User
      end
    end

    desc 'Unfollow Other User', entity: Entities::V1::User
    post "unfollow/:user_id" do
      user_authenticate!
      friend = User.find params[:user_id]
      if current_user.following?(friend)
        current_user.stop_following(friend)
        status 200
      else
        error!("You already unfollow them!", 405)
      end
    end
  end
end
