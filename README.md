# UnityAnimatorChangeSprite
This script will swap sprite of an active animator to another one with the same dimensions.

Just add this script to a gameobject with animator and change "swappedTexture" through script or in editor and place both .shader files into Resources/Shaders folder. Be sure to specify which shader you wish to use in the .cs file. Afterwards you can swap texture through the script with a SwapTexture(Texture2D _toWhat) function.
This will make animation of characters with different clothes way easier. You can animate main character and swap his clothes on the fly
