import mecab_ko as MeCab
import mecab_ko_dic

tagger = MeCab.Tagger(mecab_ko_dic.MECAB_ARGS)
tokens = tagger.parse("멋쟁이토마토의보조배터리텔레비전재밌어아이폰16프로").split()

stoptags = ["NNG", "NNP", "NNB", "NR", "NP", "SL", "SH", "SN", "NNBC"]
word = None
for idx, t in enumerate(tokens) :
    if idx % 2 == 0:
        word = t
    else :
        tag = t[:t.find(",")]

        if tag in stoptags :
            print(word)