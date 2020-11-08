:- op(500,xfx,na).
:- op(500,xfy,ad).
:- op(500,yfx,ae).

ae(_, _).
ad(_, _).

/*
    alínea a):
        ae(na(a,b),c)
    alínea b):
        Erro
    alínea c):
        ad(a,na(b,c))
    alínea d):
        Erro
    alínea e):
        ad(a,ad(b,c))
    alínea f):
        ae(ae(a,b),c)
    alínea g):
        ad(a,ad(b,ae(ae(na(c,d),e),f)))
*/