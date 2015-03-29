** -*- koshu -*-
**
**  STRUCTURE
**    <<< 第 /sect 節は、/start という語句から始まる
**        第 /par 段落を構成要素にもっている。>>>
**

|== STRUCTURE :
  sect | maybe sect-name
    | nest /par-set -to /par-start
    | for /par-start par
  --table --forward /sect /sect-name

sect      : source SECTION-PARAGRAPH /sect /par-set
sect-name : source SECTION-NAME      /sect /sect-name
par-start : source PARAGRAPH-START   /par /start

par : member /par /par-set
    | meet par-start
    | pick /par /start
