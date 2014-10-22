class User < ActiveRecord::Base
  def self.authorize_or_create(request)
    uid = request['uid']

    if instance = find_by_uid(uid)
      return instance
    else
      info = request['info']

      create!(
        name: info['nickname'],
        realname: info['name'],
        email: info['email'],
        token: request['credentials']['token'],
        uid: uid
      )
    end
  end
end
