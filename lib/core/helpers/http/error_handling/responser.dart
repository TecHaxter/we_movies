import 'dart:developer';

typedef Responser<T> = Either<String, T>;

Responser<T> failed<T>(String l, {bool logError = true}) {
  if (logError) {
    log('Error: $l');
  }
  return Left<String, T>(l);
}

Responser<T> success<T>(T t) => Right<String, T>(t);

Either<L, R> left<L, R>(L l) => Left<L, R>(l);

Either<L, R> right<L, R>(R t) => Right<L, R>(t);

abstract class Either<L, R> {
  const Either();
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight);
  bool isLeft() => fold((_) => true, (_) => false);
  bool isRight() => fold((_) => false, (_) => true);
  R? asRight() => fold((_) => null, (_) => _);
  L? asLeft() => fold((_) => _, (_) => null);
}

class Left<L, R> extends Either<L, R> {
  final L _l;
  const Left(this._l);
  L get value => _l;
  @override
  B fold<B>(B ifLeft(L l), B ifRight(R r)) => ifLeft(_l);
  @override
  bool operator ==(other) => other is Left && other._l == _l;
  @override
  int get hashCode => _l.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R _r;
  const Right(this._r);
  R get value => _r;
  @override
  B fold<B>(B ifLeft(L l), B ifRight(R r)) => ifRight(_r);
  @override
  bool operator ==(other) => other is Right && other._r == _r;
  @override
  int get hashCode => _r.hashCode;
}
