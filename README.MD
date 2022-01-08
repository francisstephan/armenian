# Type on french keyboard, get greek text
At first, refer to the given tables to get the characters you want. After a time this will become automatic.

Try live at https://www.eludev.fr/ellas

# Programming language
The application is written with Elm, which allows for:
- easy and clean development
- very small application
- easy communication with javascript
- simple, consistent and efficient tools

# Greek breathings, accents and iota subscript

We use 6 diacritics: breathings c and q, accents è, é and â and iota subscript ç.

The diacritics may me entered in any order.

Rough breathing is obtained by adding the character c after the vowel

Smooth breathing is obtained by adding the character q after the vowel.

Accents are obtained by adding one character after the vowel: 
- é for acute : aé ==> ά
- è for grave : uè ==> ὺ
- â for circumflex : ôâ ==> ῶ

iota subscript is obtained by adding the character ç after the vowel. Example : aç ==> α̨

The program uses the Unicode Greek extended table, so the characters get rendered without problem in MS Word

## Unrecognized characters

Any character not recognized is rendered unmodified.
This extends to the improper use of diacritics:
- diacritics not following a vowel
- diacritic other than c after r
- simultaneous use of non compatible diacritics: exemple: acq ==> acq (not ἁq), aéè ==> aéè (not άè)

# Acknowledgement
I got the reference to Logeion (which allows for consultation of the major classical dictionaries: LSJ, Pape, Bailly and others, https://logeion.uchicago.edu/about ) from Lexilogos (https://www.lexilogos.com/english/greek_ancient_dictionary.htm)

# Licence
MIT
