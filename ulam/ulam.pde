void setup() {
  size(751,751);
  noSmooth();
  eratosthenes(1000000);
}

int s = 376;
IntList sieve = new IntList();
int n=1;
int offset=1;
int vert=s;
int horiz=s;

void draw() {
  point(s,s);
  
  //Up, maintain left
  for(int i = 1; i <= offset; i++){
    n += 1;
    vert -= 1;
    if(sieve.hasValue(n)){
      point(horiz, vert);
    }
  }
  
  //Right, maintain up
  for(int i = 1; i <= offset; i++){
    n += 1;
    horiz += 1;
    if(sieve.hasValue(n)){
      point(horiz, vert);
    }
  }
  
  //Down, maintain right
  offset = offset+1;
  for(int i = 1; i <= offset; i++){
    n += 1;
    vert += 1;
    if(sieve.hasValue(n)){
      point(horiz, vert);
    }
  }
  
  //Left, maintain down
  for(int i = 1; i <= offset; i++){
    n += 1;
    horiz -= 1;
    if(sieve.hasValue(n)){
      point(horiz, vert);
    }
  }
  offset=offset+1;
}

void eratosthenes(int e) {
  int l = 0;
  for(int i = 1; i <= e; i++){
    sieve.append(i);
  }
  while(pow(l, 2) <= e){   
    for(int i = 1; i < sieve.size(); i++){
      if(sieve.get(i) % sieve.get(1+l) == 0 && 
         sieve.get(i) != sieve.get(1+l)){
        sieve.set(i, 0);
      }
    }
    sieve.sortReverse();
    for(int i = sieve.size() - 1; i > 0; i--){
      if(sieve.get(i) == 0){
        sieve.remove(i);
      }
    }
    sieve.sort();
    l += 1;
  }
}