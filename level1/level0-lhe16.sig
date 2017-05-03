Capture the flag — level 0
Team name: OUTLAST
Team member: lhe16, hzhang52, mwilson3, tluo4




In this level, the target is to used Pretty Good Privacy (PGP) to decrypt our information or data that transfer as SMTP protocol which packet is in plain text. First of all, we should learn how to use the powerful tool GnuPG(based on PGP). 


1. Install GnuPGP using the package manager which is a cover on the chapter Software Installation Concepts.


2.Generate pgp key by using the command:
$gpg —gen-key
In this operation, our team chose the default key-pair algorithm( RSA and RSA) and 2048 bits long. After typing some personal information. The script will start to calculate and generate the key-pair. It will last for about few minutes and might be pending unless we take some action in another shell to free some memory for it.


3.Check the public keys in your localhost:
$gpg --list-keys
Exp: 
/home/ubuntu/.gnupg/pubring.gpg
-------------------------------
pub   2048R/0458E882 2017-04-25
uid                  Tianpei Luo (hello,world. Please hack me!!) <tluo4@stevens.edu>
sub   2048R/77756708 2017-04-25


pub   2048R/9E09402C 2017-04-25
uid                  han_key <zh355245849@gmail.com>
sub   2048R/4DCA8678 2017-04-25


pub   2048R/9BED3DD7 2016-04-27
uid                  Jan Schaumann <jschauma@cs.stevens-tech.edu>
uid                  Jan Schaumann <jschauma@stevens.edu>
uid                  Jan Schaumann <jschauma@cs.stevens.edu>
uid                  Jan Schaumann <jschauma@stevens-tech.edu>
sub   2048R/55213EC5 2016-04-27


Here we have three public keys in the database named pubring.gpg. 2048R/0458E882 is the key length and ID for this key. We could use id to specify the public key if some keys happened to have the same UID.


4.Export our public key:
$gpg -a --output your_key.gpg --export UID
-a means output is in text format and you can use your email address as UID to output the public key that wants to share with others.


5.If you've obtained a public key from someone in a text file, GPG can import it with the following command:
$gpg --import name_of_pub_key_file


6.Before we use those public key for decryption, we need to make sure the key is not a fake one that came from malicious attacker.By verifying the signature, we can identify that the piece of data is really came from intended person.
Using the command to print out the fingerprint for particualr public key:
$gpg --fingerprint UID
Then you should double-check the key fingerprint with the people who send you this public key. After verify the fingerprint, we could sign this key:
$gpg --sign-key UID


7. Encrypt the information:
$gpg -a --output cipher_text -r UID -e plain_text
-a stand for plain text for ouput.
cipher_text is the name of the file that is already ciphered. 
-r UID specify the receiver and encrypt with the public key.
-e means encrypt the plain_text file.
*if you want to encrypt a binary file just ignore the option -a


8.Decrypting the information:
If we receive a encrypted file from others, just using our secret-key to decrypt it.
$gpg --output plain_text -d cipher_text
--output is the option for the name of decrypted file.
--d is the file that we want to decipher.


9. Digital signature
First, we calculate the hash value of the message. In our signature encrypt process, we use the SHA1 algorithm for the hash function. In the messages you can see the message between "BEGIN PGP SIGNED MESSAGE" and "BEGIN PGP SIGNATURE".
Next, we encrypt that hash value with our private key. For example when I sign some files, I use my private key to do so.
Finally, a text version of that encrypted hash value is placed at the end of the message, between the "BEGIN PGP SIGNATURE" and "END PGP SIGNATURE".


Reference: http://ask-leo.com/what_does_begin_pgp_signed_message_mean.html


With the argument --sign we can add the digital signature to the document, then output to a new file. 
gpg --output doc.sig --sign doc


We can check the signature with the --verify argument after we import others public key:
gpg --verify doc.sig


Exp.


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


- -----BEGIN PGP MESSAGE-----
Version: GnuPG v1.4.15 (GNU/Linux)


owEBNwHI/pANAwACAfiXtZCeCUAsAcsHYgFhWQUOYYkBHAQAAQIABgUCWQUOYQAK
CRD4l7WQnglALLxJB/94Q0GPSbBdilbIP9U49l3VffMd2bA9WmzV7Owpj8cVn7HX
PiGocUhs9bOvsORv7GwGDTC98lvUhtxU+3z/vkAZ/qg4Er/QSqZ/RIil8Vlp3+BN
60q5Peq8xPm0h8hOWjqVyr7NreK/r1izNfA10evi/w4FKS1otFpzEM8qDYPDg4Gk
+J9O93EeVnACciJg8cTvkTXeSu0biPEL7jdQOtkMufDytzVSPb2ekGGPaczIJg3R
utZ0+/sxaK4s9LBox9GxYhEMMMW0rwpbv2/y6z1V1QGb/1zm3ZSrs6TRiVUPtaTU
1r1b3pn+qpp2lunEqhgbL+KWBEIinDzEY6F/mpir
=Gxqo
- -----END PGP MESSAGE-----
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)


iQEcBAEBAgAGBQJZBQ7XAAoJEPiXtZCeCUAsKQoIAIUyjsaK2Al92SvDMPLI+YLj
SAu9fl13gOBVw0kpbs72dcjIF50ok86SYdgIAL6rj4IjwqOEDdbHQhGbFQMKjHjZ
2KiR/bAFD316SHsRg2U2dW6Xg1ewtsTYdkczM4QPBCINgBKdPY24i/wbTeNtU/LB
Tf2zmziT3pFRFeLnqTX0uIEScffJJw653JcBRjq5lbhUEispIOznfqqJFlnr1AwM
AKFHYRtdnffQwncqZg+Hrbq8ESRTw1VasBxUjsJCCQHPcmInMO12PfgZCfg9GO37
WyBSmUseBAs8cPE8gkJ8K+OytX9z9XX3G9f10IJE7FrUHwYQsVSyl6wh2MMM2Gk=
=Qx/d
-----END PGP SIGNATURE-----














Team members’ pgp public key:


lhe16:


-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1


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
=Bzvj
-----END PGP PUBLIC KEY BLOCK-----




hzhang52:
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.15 (GNU/Linux)


mQENBFj/p24BCAC3s9v9Ee9erbdk6pTKzDcys+mZ0myioVLXe2z6u1hbvVBm1XN6
Tvoy/qas2MvIn2b8r5aaV7lrUIDVT9cCTy6mrlvv76bA12hKEOhB64AxCX8ed9no
ocOreZcgZBTXzW4m3JVAYtUszwKpR8Zx2gGWQRgIgznoqOTCpHUV8zXVRGP10Z19
KxGDDSj68cIRkbq8GD1DmBbWqCrJIs3GQ6jkkWR9dKqAoPMJwjnPJ2GJ3XP15Coq
1G2iPaCldjRRqAAlIajkEjdDZ0Mfti/LEGgNdECBHavYvp7xifputvt3ttcCkRAu
VWSylQ0mHK2KgrQ2Fe267diZIWrMd79zOQjhABEBAAG0H2hhbl9rZXkgPHpoMzU1
MjQ1ODQ5QGdtYWlsLmNvbT6JATgEEwECACIFAlj/p24CGwMGCwkIBwMCBhUIAgkK
CwQWAgMBAh4BAheAAAoJEPiXtZCeCUAs++IH/3NIYpElVVIDkaYexSYWsjxj0oyd
YdWFiRkSClZjiuhL/pSD1WL6jNaezKD3ohC2Nb3sAuQRwwWQKVYRz/XD8GbnMLRN
7NjTy8MP6r6dBkc5GFx1EwcKM3UQYphcb+zdUuDv6Vl7EbotpeqveHCZ5LQ/4OdS
uHOCDZagNZ5AUXHCusZSNDerZc5zhcTcDIJDN3w89XgVFGt6KMS28kJBWr0i69Ru
pioO17LzloVGQ4d+Ard8dc35BrPGjCXQzjTrSO85rYg4b8XwREdxoroCFuIM7IEJ
Tp2FkdFgIzTE7AJe1bfRDYxNHXzkobEb401zE0slBLT6FRjCjmxwT9qskfW5AQ0E
WP+nbgEIAO8teK2EExf/quxiREDXV2Hrdnl5Ms7ZvMY2dl8BaBWE3n070MxpL+aM
3mmJ3mGbQL51fbSE8fv9KTCZHcBRmfs6OlcabD+fTPhtAHuSE5xtOs2QdaIIuPbM
IhglO0iHGjRgJqZODnSCWbJSA7kpPVh9TpsEaDvY1ibcQ1lS1U0fiFeWCxOqsafQ
YtxeLF8f3lKKfQ1+tzENUy0NNXF5Ue27pcMAGu+Lhf7wfloKIknLp3YNP6XCKR52
eHiyf5vnZkEC5lpGAz1FbuFODbkuyv81H1I3N64m3sHezMBAHchZGFnwV7Wxthyt
K3vp6QpFuvBZI4WI8TSZTquBXqXIuk0AEQEAAYkBHwQYAQIACQUCWP+nbgIbDAAK
CRD4l7WQnglALKPVB/92cD/ipx5PrbV4Je0jvyj+CDai20bdnCd38s85AAp3aR+P
zzLoETLp33aFG6JGW+nh6BCR7krragRwXhcXyrevR8fStMjy49Y5Mu/EC83Xv2mX
lHOLtLwlclmRa49QLIjPvjISc2H40hoFG96w4ZFouFSkDfC0ltbuGXi9RCZ2f8OF
k+GJ9+8LkjpYI+zafcgfs5aUa4px5I2wDJbmq0lvRThiMA1GyPmPWrAjeeguARDs
muC9dhbVm6ICCRh3O76+Nn3jeO8FLmGcFEq4bMiLu8gchj2YdZ9vKjUG2Vn1Y+aZ
fh77sjE5ZtXNhQHpIKeB8CvkMn8ExWSpmpoyDXaV
=mXhB
-----END PGP PUBLIC KEY BLOCK-----


Mark Wilson - mwilson3
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1


mQENBFkGMZ0BCACWoTi2kQK9ceFgqevESf9zkamWZDJGyTMPsbj9GxpS3XDPTFkM
rzjkYPPBowPYOiwSITreL6Y72BN+SXG3uZeBJmTQJs5IghhIgNY8k46242yFmgQd
lboIx10HeF9GJn0nkEa1uiDPyZNjHLfO0qx0qUbgIhRuFBTIt1fotO3B0u9gsB9n
DuizTHRs9l86ce/F1fjDzpmj4WewEwIqtf2eo3+qZPemJ7yKDCdLqKOkIDuPNgs8
wLJSSiMgHzSyxj+mmeidLone66ILx+1u9vdh5vkausyT5o8R9A7ORG9c40avQC5I
ym6ZAxSBXRQg2VxVuHS2gyJ0+HgsdhK+P52tABEBAAG0Ik1hcmsgV2lsc29uIDxt
d2lsc29uM0BzdGV2ZW5zLmVkdT6JATgEEwECACIFAlkGMZ0CGwMGCwkIBwMCBhUI
AgkKCwQWAgMBAh4BAheAAAoJEKDNh5id6Z1aXbcH/jWTbYD2yLtpSxCwzSv/fauF
NIZFxfCRMi8BAGugNUilaQ4ERss5Qtd+qAK9ei4F4bDLvxjGmj/H9RFZbapCDSM1
ZRK1GKxjIQHFfxS+HNSnWBsoRBQ5Kn9wrCVb6uFcg0I3HBX3eNNqLyujHFDqDupz
NwLakAD960mj+u0u1zJY0fL6BED6Oe0vO73TzpTWDCmzxmCI8LVqmcV1mu+Dbz9V
M9uZrO8MHGMZfmxhkGLV36vTSS+DZgD2yWtNSQmpQ87McZKWG2GJN/Jl4OYpI7um
UQ9fYIKK6E5NrtUS9zwtoNLhkPT3M+iPGOVR0nWSLkS6GIJUk96bjcNd7O6mJY25
AQ0EWQYxnQEIANoKF/Kgb4cmzkrIuvQ/zkaX3qV+r0PGjxqJB8meqOtUabN/nXht
1f1yYO0qcICdmqk/NjT5vz4FYeNFv9JjY6un66mCGf8kJZoiahVPyOUbiFJwQZXL
gcIroMMy7AqLi+k1wsZJYM991A6HcJF8rmBn1HXSVRA9+Z4fRGaI7FVFv3zX7iAP
Tn7Itx8tRhxucoXzGoZKuCvMskVveAYRoztTKu7OQZHOZ5VwUoKarnfUfIw8E8Kr
XmZlVQP2gTTlh9oICMa2a7PZX8JaepTEnD2PpWbavfS6GgS9uf3VchWCkl+WWpkW
T/rjCih7UTDUXJzrZCcEtQKA25ixjfOwBeMAEQEAAYkBHwQYAQIACQUCWQYxnQIb
DAAKCRCgzYeYnemdWlT6B/0cOlogaJVh+SpRT8Wg4P3FAftwSzpkNjy/kWSSPw2Z
+Lim7CtpNIYWpJqm3Psm0uv6ERFnnvrmwCekltov0b/36yIZV/8oygr3rlMC7nU9
3qpIGW5XnhA57HDs9jVw5ybAzqqTOBbwi52nZo2PgqZZBGE6GCL8aGvULGp1nW85
TEjwUpJI1ND8eZFDOIF9C8+SeDATh9K+tOgMDNJRv+RlY89tqwL4rSMEHT5QOps5
238UolAgH+X5Jx1mhTUfV0PUvtY2YZVj603VWzDchMWvae3P7VjsIcxbwKmOafBX
6+k5z8mmgh1X8KZIJ5sxlfKOQiE84UJVHAEkvwTJVns6
=HQrG
-----END PGP PUBLIC KEY BLOCK-----




Tianpei Luo -- tluo4
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.15 (GNU/Linux)


mQENBFj/t8UBCAC77Emas2L0G4Ed9ktJjnPXC4wn1QjA3sealoSUUjKBF2keSm9r
LoG28lmkPz9LL2uXS/nb1R+d+RNwEXA8k8EhZMIYSHwWg3Qvmj+IOMWY5sCX3kUC
ax3A9yMrgP8e6N1WEGuy+WhZzTh4bH+qK6if48PmLN4z6t7+h/9wJT3ePIOCZ/me
uqWd/ws16sR7fw9oFQkpnKRUKAW41+slwHLCd3VvW3OO73dTyKF28gKwFcTU5Z5/
w0QaRdzQZuutT8+Um+vk4O5DXaf7fFNpRYxNVtMHYR4bmpW3jHhvNuY0DJnl337Z
HRYv8lBdu9EYr5eKn3dmofMwDfjSyziJ7AKRABEBAAG0P1RpYW5wZWkgTHVvICho
ZWxsbyx3b3JsZC4gUGxlYXNlIGhhY2sgbWUhISkgPHRsdW80QHN0ZXZlbnMuZWR1
PokBOAQTAQIAIgUCWP+3xQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ
s7FIMARY6IIV2wf/aNtryMBatnQuO6mRJAzHd9UbFDdg3aSGdI/bdHT1dS/HwIhW
BoCcb3yqifi06y/Uvtx0enMBlPPWCYu0IdrI32agpCyXwNCxeSEzlZ5TRFfhPM9h
gpr7OwibcZ/fjyaT5CZsBm+ihY3j4LE3Z2hayCk+vPbIW/BMsjyMEUt/QUuD0lLq
UT9Qf0Rq8yJEGJ2U8z2MPXgJ4NVddhKmFvboIakiX4o/G+tuWfVEAsCwJBZ86TMy
LYmdRimdsZLaLrRUn+urWnF+quv+jOzGg52k/9tJI/OUw2Q8vQeyOYxM3+HWlzDQ
NY27SOE0VImDXCD1Owev030rQ3BbWUH3E5GrpLkBDQRY/7fFAQgAy46G3/cnho+N
ZqNr3vupNMZJTUFJPQQMRFW8i3hxc2sxogPnOjgRg0mvfxXZz65tbM97xmMLBZrg
44ynvIyQMir9q0TB2Bu6fo3h3ND36Uw0QLXHP6zcDSJXSnPptk39Q1gs5VCiCbWo
tHOvB2PrueVKbCnkIF75XyqKOs3u5jqFcgUpIBtAzp9MrMa3BlCgcGECbS4/UBlX
dEhkL8A19E84uedIOHj8tii6RslS6ja1yULYRCF06HaikNBlxcH2YevKOyEWIbMk
yrnjPxzZFzuq5W3HRMLUc7mgoxtfL5SGDBtkKuL0ogIOCUEufFCFTwimpAZF/Z3p
en0Bd2me2wARAQABiQEfBBgBAgAJBQJY/7fFAhsMAAoJELOxSDAEWOiC0qMH/2Ym
E4meGmKPUR2ZsCXP32PWO+6UaqZVfUQkZWy1dWVlHkLSgaBE0/w5nJ+v2qF3W2yY
ErMjO1LJ8JtaqSNx4iKWmMyBSuCGGPcE7AHYikCCvBMWSXczGwc2aqt+t6yeb7qL
MwdttYMtkLKwohBa2t4LoFpjERXwptc2L/GkQ9vOKyz8L0V4SooffAeA0Fkd/YzF
Yo1h2eYC8BN8WGmPw35uUjX07QtxH/MEGx73tC/nrXAJFO8Q39KWW+Z+8u7U1b3j
2Q1b7YlQaM/ewyXqEJAGA0U8LNyRfH1g06G6lMLLv1dtyBFWtvLUUI+JGSOZYsN3
og26GGk3dapqGS/UWNU=
=jBXB
-----END PGP PUBLIC KEY BLOCK-----




Public ssh key:
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1wscgQdMPuBXqR3byHFt+3DyumqOFsA3pYwcxQ3J2+ZwdyjPoxNWAwlJlYf62xLcuV0s5YBeknJUNqmf3HQXpGcmgjWDdske/xhiCXSNsg+mk0lX9xJsrutiZmiU+V97KL5IP3nPGKl8HMV3TCD/bt3OFLuYKFbaoTY+5YQ9NFe/XLVBd2365jBaKHougHI7Aug8kH00E7GC9wZjBmf0GfpgwqlbDoxCyj7WQ0aw4yNL/nBCaJqOxxNFU0ldOQhMJUfla6LjXyJm79T7VvKmWi1OI8+1KOLN6+IMAgKx5S0d2+PQM/yVOhs+Q1zjqJzbMeTKBRrKsdZYHMciKUef/ ubuntu@ip-172-31-21-243

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJZBkezAAoJEHetjVVfOOtF+ugP/1LSTp7mvdvYk6Z2T5b9Kzkg
JxgEPfE75wsO7PaqiX/rujXPzdxxVx2/w8V4/yj58o5j0x0d11hiaBUrYt2PHLau
Uqfa/pJpL0ET1fIO21AxIq5scHqlBrtBFNvrQPi33AqVScECsg0bKQKZvwwcwMXW
CpIeQ6h+LhdG+PSBWcXzb+8kjuuObgwTGFf0r1kwlu9KwZpIzfOVCDH2b7I2B7zU
G4r0HmqDrRF1yLBZxCtVnWNrzrP8g/Qlkt7ON1c8mVBzzMk9/t4xmTkLQLvRftiw
dbGJZFPT6oiAn3SssD/prcyQz3DAkyWD4vtNTSHjs94DSoUb4k/MmDrWxtULmWj3
c58hMqZyBp5akiiyzuBH5WUOebDAvC9tcy6x2Jy2ZouDrHIlJOwgnWDflh1NfxyY
HqakLKeOzrDbZdiKIzpZp3ZS3EqO00sgWh+DZTn3d0aOSOBY1HmIZmq56e5dyUvx
uo4lT0nCgcXf6ASVABDGszou/rqsV43rM4Q92S/+JQtoYBE5JArMwHI2v9RNdT/a
rk/oT2iv5UWN17PSHHMXBdNnk80jFLx2w0gphkjt/VDcPgXWPvJ0seM+ebQG+hQx
TQcqJmdxEcrB7iDiTVN74IECM8cqgf/hH1pIy8x+ElzPGXAQx+C+/ZA8PEaq9IFU
2VPsryXFz+YobELD5Oc+
=aJew
-----END PGP SIGNATURE-----
