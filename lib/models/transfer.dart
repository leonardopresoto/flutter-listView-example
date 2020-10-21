class Transfer{
  double value;
  int account;

  Transfer(this.account, this.value,);

  String toString(){
    return 'Transfer {account: $account, value: $value}';
  }

}