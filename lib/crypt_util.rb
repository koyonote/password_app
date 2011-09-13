#
#= OpenSSL を利用して暗号化・復号を実行するクラスライブラリ
#
#Authors::   Namakesugi
#Version::   1.0 2010/09/19
#Copyright:: Copyright (C) Namakesugi, 2009-2010. All rights reserved.
#License::   Ruby ライセンスに準拠
class CryptUtil
  require 'openssl'
  # 暗号化方式としてのAES-256-CBCを定義します
  AES_256_CBC = 0

  #== ランダムパスワードを生成します
  # _return_size_を指定することで、任意の桁数のパスワードを生成できます
  # _return_size_がFixnumオブジェクトでない場合はnilを返します
  # _return_size_が0以下の場合はnilを返します
  #_return_size_ ... 生成するパスワードの桁数
  def self.create_password(return_size = 8)
    # return_sizeの型がFixnumで無い or return_sizeが0以下ならばnilを返す
    return nil if return_size.class.to_s != "Fixnum" or return_size <= 0
    # OpennSSLを利用してランダム値を生成する
    return OpenSSL::Random.random_bytes(return_size)
  end

  #== 文字列を暗号化します。
  # 暗号化された16進数変換された文字列を返します
  #_plain_text_ ... 暗号化する対象の文字列
  #_key_ ... 暗号化するための秘密鍵
  #_salt_ ... 暗号化するためのサルトキー(8bit)
  #_type_ ... 暗号化方式
  def self.encrypt(plain_text, key, salt, type = CryptUtil::AES_256_CBC)
    result = ""
    case type
    when CryptUtil::AES_256_CBC
      result = CryptUtil.encrypt_aes256(plain_text, key, salt)
    end

    raise "Invalid parameter" if result == nil
    # unpackでH*形式に変換します
    return result.unpack("H*").join
  end

  #== 文字列を複号します。
  # 16進数変換された暗号化された文字列を渡すことにより、復号された文字列を返します。
  # 正常に復号できない場合はraiseされます
  #_encrypt_text_ ... 暗号化する対象の文字列(16進数文字列である必要があります)
  #_key_ ... 復号するための秘密鍵
  #_salt_ ... 復号するためのサルトキー(8bit)
  #_type_ ... 復号方式
  def self.decrypt(encrypt_text, key, salt, type = CryptUtil::AES_256_CBC)
    # Array#packで16進数文字列を再度パック化します。
    convert_text = [encrypt_text].pack("H*")
    result = ""
    case type
    when CryptUtil::AES_256_CBC
      result = CryptUtil.decrypt_aes256(convert_text, key, salt)
    end

    raise "Invalid parameter" if result == nil
    return result
  end

  #== AES256で文字列を暗号化します
  # 暗号化にはAES-256-CBCを用います
  # saltは8byteである必要があります
  def self.encrypt_aes256(plain_text, key, salt)
    begin
      cipher = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
      cipher.encrypt
      cipher.pkcs5_keyivgen(key.to_s, salt.to_s)
      return cipher.update(plain_text.to_s) + cipher.final
    rescue
      return nil
    end
  end

  #== AES-256-CBCで暗号化された文字列を復号します
  # 復号にはAES-256-CBCを用います。
  # saltは8byteである必要があります
  def self.decrypt_aes256(encrypt_text, key, salt)
    begin
      cipher = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
      cipher.decrypt
      cipher.pkcs5_keyivgen(key.to_s, salt.to_s)
      return cipher.update(encrypt_text.to_s) + cipher.final
    rescue
      return nil
    end
  end
end
