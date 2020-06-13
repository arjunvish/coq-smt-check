type ('a,'b,'c) pattern =
| Glob of Constr.t Lazy.t
| EGlob of Constr.t
| Glob_no_univ of Constr.t Lazy.t
| EGlob_no_univ of Constr.t
| App of ('a,'b,'c) pattern * ('a,'b,'c) pattern
| Lam of 'b * ('a,'b,'c) pattern * ('a,'b,'c) pattern
| As of ('a,'b,'c) pattern * 'a
| Ref of 'b
| Choice of (('a,'b,'c) pattern) list
| Impl of ('a,'b,'c) pattern * ('a,'b,'c) pattern
| Pi of ('a,'b,'c) pattern * ('a,'b,'c) pattern
| Sort
| Ignore
| Filter of ('c -> Constr.t -> bool) * ('a,'b,'c) pattern

exception Match_failure

val apps : ('a,'b,'c) pattern -> ('a,'b,'c) pattern list -> ('a,'b,'c) pattern

val get : 'a -> ('a,'b,'c) pattern

val match_pattern : ('a,'b,'c) pattern -> Constr.t -> 'c -> ('a,Constr.t) Hashtbl.t -> ('a,Constr.t) Hashtbl.t

val matches : 'a -> (('b,'d,'a) pattern * ('a -> ('b, Constr.t) Hashtbl.t -> 'c)) list -> Constr.t -> 'c

val matches_app : 'a -> (('b,'d,'a) pattern * ('a -> ('b, Constr.t) Hashtbl.t -> 'c)) list -> Constr.t -> Constr.t array -> int -> 'c