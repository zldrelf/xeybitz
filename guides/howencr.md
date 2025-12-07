SOF

Encrypt using GPG
gpg -c video.mp4
Decrypt using GPG
gpg video.mp4.gpg

Encrypt using openssl
openssl enc -aes-256-cbc -md sha256 -salt -pbkdf2 -iter 100000 -in me-10-31-25.tar -out me-10-31-25.tar.en
Decrypt using openssl
openssl enc -aes-256-cbc -d -md sha256 -salt -iter 100000 -in video.mp4.enc -out video.mp4

Permently Delete/Shred a file
shred -u video.mp4

Uncompresses tar
tar -cf file.tar video.mp4 file.md

EOF
