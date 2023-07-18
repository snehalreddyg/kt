import java.util.*;
class Bst<T extends Comparable<T>>{
private Node<T> root;
static class Node<T>
{
T data;
Node<T> left;
Node<T> right;
Node(T data)
{
this.data=data;
left=null;
right=null;
}
}
public void insert(T value)
{
root=insertRecursive(root,value);
}
private Node<T> insertRecursive(Node<T> current,T value)
{
if(current==null)
{
return new Node<>(value);
}
if(value.compareTo(current.data)<0)
{
current.left=insertRecursive(current.left,value);
}
else if(value.compareTo(current.data)>0)
{
current.right=insertRecursive(current.right,value);
}
return current;
}
public Collection<T> inOrderTraversal()
{
Collection<T> result=new LinkedList<>();
inOrderRecursive(root,result);
return result;
}
public void inOrderRecursive(Node<T> current,Collection<T> result)
{
if(current!=null)
{
inOrderRecursive(current.left,result);
result.add(current.data);
inOrderRecursive(current.right,result);
}
}

public Collection<T> preOrderTraversal()
{
Collection<T> result=new LinkedList<>();
preOrderRecursive(root,result);
return result;
}
public void preOrderRecursive(Node<T> current,Collection<T> result)
{
if(current!=null)
{

result.add(current.data);
inOrderRecursive(current.left,result);
inOrderRecursive(current.right,result);
}
}

public Collection<T> postOrderTraversal()
{
Collection<T> result=new LinkedList<>();
postOrderRecursive(root,result);
return result;
}
public void postOrderRecursive(Node<T> current,Collection<T> result)
{
if(current!=null)
{
inOrderRecursive(current.left,result);

inOrderRecursive(current.right,result);
result.add(current.data);
}
}
}



public class BstMain
{
public static void main(String[] args)
{
Bst<Integer> bst=new Bst<>();
bst.insert(6);
bst.insert(7);
bst.insert(4);
bst.insert(9);
System.out.println("inorder:"+bst.inOrderTraversal());
System.out.println("preorder:"+bst.preOrderTraversal());
System.out.println("postorder:"+bst.postOrderTraversal());
}
}
