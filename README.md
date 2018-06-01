# US International Swiss Latin Keyboard Layout

# About

As a coder and mechanical keyboard user, I like to use keyboards with the US ANSI layout (104 keys).

As a coder, because many of the special characters, such as `{ } [ ] < >` are easier to type on the US layout. And as a mechanical keyboard user, because it is extremely difficult to get some mechanical keyboards, and especially nice keycaps sets, for layouts other than US, not to mention the Swiss layout, used by relatively very few people in the world.

The problem with the US layout is that it is impossible to write accentuated characters as used in languages such as French or German.

There exist some international variations of the US layout. The problem is that they are not geared towards a specific language, attempts to provide as much variety as possible and end up unusable for real typing. Also, there is no cross-platform US-International layout, i.e. there is no layout that looks the same in Windows, Linux and MacOS.

So I decided to make my own layout, taylor-suited to my own needs, that is :

- based on the US layout
- easy typing of accentuated characters for the following languages (more or less in that oreder of priority):
 - French
 - German
 - Portuguese
 - Spanish
- Minimal use of dead keys
- No dead keys for frequently used characters

This is the result. Given the languages supported, that is English of course, the two most used Swiss languages (sorry, Ticino!), plus Portuguese and Spanish, two romance languages, I came up with the very original name US-International-Swiss-Latin. 

For now, there is only a Windows version. An older version of a similar version for Mac is available in my other [https://github.com/HereThereBeMonsters/MacKeyboardLayout](Mac keyboard repository) but not supported any more.

I am planning to make a Linux version in the (hopefuly near) future, but don't count on it, make you own if you really need it now.

I am probably not the only one with these needs. There are probably dozens of us ;) So if you think it will be useful to you, enjoy it. I welcome any feedback!

# Layout

Here is a picture of the layout (made with http://www.keyboard-layout-editor.com, the source JSON file is in the root of the repo and it is stored in this [gist](http://www.keyboard-layout-editor.com/#/gists/b3b26762c7a3d9ad980f1c7f561b26d8) :

![Picture of the layout](layout.png)

In this picture, the character at the bootom left of the key is the one produced without any modifier. The one on the upper left id the one produced with [shift]. The one on the bottom right is the one with [alt-gr] (the right [alt] key) and the one on the upper-right is the one with [shift] + [alt-gr].

## Basic principle

As you can see, without using the [alt-gr key] the layout is the 
The basic idea for the layout is the following: use the [alt-gr] key (the right [alt] key) in combination for the basic letter to create the most used accentuated or character. For example

[alt-gr] + [e] -> é
[alt-gr] + [o] -> ö
[alt-gr] + [n] -> ñ
[alt-gr] + [c] -> ç

Then, for vowels that have many possible accnted variants, use the neighboring keys for other frequently used combinations, e.g:

[alt-gr] + [w] -> è
[alt-gr] + [r] -> ê

and so on...

The [alt-gr] + vowel combinations also work with upper case letters, so:

[alt-gr] + [shift] + [e] -> É
[alt-gr] + [shift] + [o] -> Ö
etc.

## Dead keys

In addition to the characters typed directly with [alt-gr] + letter, there are also 5 dead keys used to type rarely used accentuated characters.

First the [`~] key is a bit special. Used without the [alt-gr] modifer it just types the `` and ~ characters, which is useful for coding.

With the [alt-gr] modifier, it turns into a dead key, so:

[alt-gr] + [`~] then [a] -> à
[alt-gr] + [shift] + [`~] then [a] -> ã

Then, [alt-gr] + ['"] is a dead key for ¨ (umlaut):

[alt-gr] + ['"] then [a] -> ä

[alt-gr] + [ \ ] is a dead key for TODO (grave accent)

[alt-gr] + [/] is a dead key for [´] (acute accent)

Except for the tilde, those dead kezs all work for the letters A, E, I, O, and U.

# How to use

## Windows

The layout was made using Microsoft Keyboard Layout Creator (KLC), that can be downloaed [here](https://www.microsoft.com/en-us/download/confirmation.aspx?id=22339).

It required the .Net framework version 2.0 that can be downloaded [here](https://www.microsoft.com/en-us/download/details.aspx?id=16614).

In order to modify the keyboard, just open the `*.klc` file in KLC.

The binaries are provided in the `windows/build` folder as ZIP archives. To install the layout, download the relevant ZIP file, decompress it and run the setup.exe file, which will add the lazout to zour windows installation. Then zou have to add the layout to zour user profile. This has become a little convoluted in Windows 10, but Google will help you find a HowTo for that.

## Linux

To Do...
