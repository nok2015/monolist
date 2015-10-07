class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships, foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships
  
  # 外部キーとしてitem_idを用いる。wantsは仮想的な中間テーブルとなる
  has_many :wants, foreign_key: "item_id", dependent: :destroy
  has_many :want_users, through: :wants, source: :user #belongs_to :userのuserを取得する
  
  # 外部キーとしてitem_idを用いる。havesは仮想的な中間テーブルとなる
  has_many :haves, class_name: "Have", foreign_key: "item_id", dependent: :destroy
  has_many :have_users, through: :haves, source: :user
  
  
end