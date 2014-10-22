class User < ActiveRecord::Base
  def self.authorize_or_create(request)
    uid = request['uid']

    if instance = find_by_uid(uid)
      return instance
    else
      info = request['info']

      create!(
        uid:      uid,
        name:     info['nickname'],
        email:    info['email'],
        realname: info['name']
      )
    end
  end
end
